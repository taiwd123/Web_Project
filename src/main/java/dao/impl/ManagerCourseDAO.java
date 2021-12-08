package dao.impl;

import dao.IManagerCourseDAO;
import entity.Course;
import entity.Exam;
import entity.Score;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

public class ManagerCourseDAO extends AbstractDAO<Course> implements IManagerCourseDAO {
    @Override
    public List<Course> getListAddCourse(Integer userID){
        List<Course> list = new ArrayList<Course>();

        Session session = HibernateUtil.getSessionFactory().openSession();

        try{
            if(getListCourseUser(userID).size() != 0){
                String hql = "select distinct c from Course c where c not in (select c1 from Course c1, RegisterCourse rc where rc.user.id = :id and c1.id = rc.course.id)";
                /*Query<?> query =session.createQuery(hql);
                query.setParameter("id", userID);
                List<?> result = query.list();
                for(int i=0; i<result.size(); i++) {
                    Object[] row = (Object[]) result.get(i);
                    Course course = new Course();
                    course.setId((Integer) row[0]);
                    course.setCourseName((String) row[1]);
                    course.setCourseImage((String) row[2]);
                    course.setDescription((String) row[3]);
                    list.add(course);
                }*/
                Query<Course> query = session.createQuery(hql);
                query.setParameter("id",userID);
                list = query.list();
            }
            else {
                String hql = "select c FROM Course c";
                Query<Course> query = session.createQuery(hql);
                list = query.list();
            }

        }
        catch (Exception e){
            System.out.println("Loi");
        }
        finally {
            session.close();
        }

        return list;
    }

    @Override
    public List<Course> getListCourseUser(Integer userID) {
        List<Course> list = new ArrayList<Course>();

        Session session = HibernateUtil.getSessionFactory().openSession();

        try{
            String hql = "select distinct c from Course c, RegisterCourse rc where c.id = rc.course.id and rc.user.id = :id";
            Query<Course> query = session.createQuery(hql);
            query.setParameter("id", userID);
            list = query.list();
        }
        catch (Exception e){
            System.out.println("Loi");
        }
        finally {
            session.close();
        }

        return list;
    }

    @Override
    public int countExamOfCourse(Integer courseID) {
        int count = 0;
        Session session =HibernateUtil.getSessionFactory().openSession();
        try {
            Query<Exam> query = session.createQuery("select e from Course c, Exam e where c.id = :courseid and e.course.id = c.id");
            query.setParameter("courseid", courseID);
            count = query.list().size();
        }catch (Exception e){
            System.out.println("Loi");
        }
        return count;
    }

    @Override
    public int countExamFinishOfCourse(Integer userID, Integer courseID) {
        int count = 0;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            Query<Score> query = session.createQuery("select s from Score s, Exam e where e.id = s.exam.id and s.user.id = :userid and e.course.id = :courseid");
            query.setParameter("userid", userID);
            query.setParameter("courseid", courseID);

            count = query.list().size();
        }
        catch (Exception e){
            System.out.println("Loi");
        }
        finally {
            session.close();
        }
        return count;
    }
}
