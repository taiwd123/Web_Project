package dao.impl;


import dao.IScoreDAO;
import entity.Question;
import entity.Score;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;

import java.util.List;

public class ScoreDAO extends  AbstractDAO<Score> implements IScoreDAO {
    @Override
    public Score findByExamIdAndUserId(Integer examId, Integer userId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Score result = null;
        try {
            Query<Score> query = session.createQuery("Select u FROM Score u WHERE u.exam.id = :examid and u.user.id = :userid");
            query.setParameter("examid", examId);
            query.setParameter("userid", userId);
            if(query.list().size() != 0){
                result=query.getSingleResult();
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
