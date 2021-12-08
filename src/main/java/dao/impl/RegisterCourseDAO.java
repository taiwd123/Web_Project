package dao.impl;

import dao.IRegisterCourseDAO;
import entity.Exam;
import entity.RegisterCourse;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;

import java.util.List;

public class RegisterCourseDAO extends AbstractDAO<RegisterCourse>  implements IRegisterCourseDAO {
    @Override
    public List<RegisterCourse> findRegisterByCourseId(Integer courseId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<RegisterCourse> result = null;
        try {
            Query<RegisterCourse> query = session.createQuery("Select u FROM Exam u WHERE u.course.id = :id");
            query.setParameter("id", courseId);
            if(query.list().size() != 0){
                result=query.getResultList();
            }
        }catch (Exception e) {
            System.out.println(e.toString());
            session.getTransaction().rollback();
        }finally {
            session.close();
        }
        return result;
    }
    @Override
    public List<RegisterCourse> findByCourseId(Integer courseId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<RegisterCourse> result = null;
        try {
            Query<RegisterCourse> query = session.createQuery("Select u FROM RegisterCourse u WHERE u.course.id = :id");
            query.setParameter("id", courseId);
            if(query.list().size() != 0){
                result=query.getResultList();
            }
        }catch (Exception e) {
            System.out.println(e.toString());
            session.getTransaction().rollback();
        }finally {
            session.close();
        }
        return result;
    }

    @Override
    public List<Object[]> CountUserIdGroupByCourseId() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Object[]> result = null;
        try {
            Query<Object[]> query = session.createQuery("Select count(u.user.id) , u.course.id  FROM RegisterCourse u group by u.course.id");
            if(query.list().size() != 0){
                result=query.getResultList();
            }
        }catch (Exception e) {
            System.out.println(e.toString());
            session.getTransaction().rollback();
        }finally {
            session.close();
        }

        return result;
    }
}
