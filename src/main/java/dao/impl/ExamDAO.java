package dao.impl;

import dao.IExamDAO;
import dto.ExamDTO;
import dto.ScoreDTO;
import entity.Exam;
import entity.Question;
import org.hibernate.Session;
import org.hibernate.query.Query;
import service.IScoreService;
import service.impl.ScoreService;
import util.HibernateUtil;

import java.util.List;

public class ExamDAO extends AbstractDAO<Exam> implements IExamDAO {
    @Override
    public List<Exam> findAllQuestionsByCourseID(Integer courseId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Exam> result = null;
        try {
            Query<Exam> query = session.createQuery("Select u FROM Exam u WHERE u.course.id = :id");
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




}
