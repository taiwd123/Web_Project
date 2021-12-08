package dao.impl;

import dao.IPreviewDAO;
import entity.Preview;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;

import java.util.List;

public class PreviewDAO extends AbstractDAO<Preview> implements IPreviewDAO {
    @Override
    public List<Preview> findByUserId(Integer userId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Preview> result = null;
        try {
            Query<Preview> query = session.createQuery("Select u FROM Preview u WHERE u.user.id = :id");
            query.setParameter("id", userId);
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
