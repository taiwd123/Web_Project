package dao.impl;

import dao.IQuestionDAO;
import entity.Question;
import org.apache.commons.lang.StringUtils;
import org.hibernate.Session;
import org.hibernate.query.Query;
import paging.Pageble;
import util.HibernateUtil;

import java.util.ArrayList;
import java.util.List;


public class QuestionDAO extends AbstractDAO<Question> implements IQuestionDAO {
    @Override
    public List<Question> findAllQuestionsByExamID(Integer id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Question> result = new ArrayList<Question>();
        try {
            Query<Question> query = session.createQuery("Select u FROM Question u WHERE u.exam.id = :id");
            query.setParameter("id", id);
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
