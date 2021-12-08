package dao.impl;

import dao.IDocumentDAO;
import entity.Document;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;

import java.util.List;

public class DocumentDAO extends AbstractDAO<Document> implements IDocumentDAO {

    @Override
    public List<Document> findAllDocumentsByCourseID(Integer courseId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Document> result = null;
        try {
            Query<Document> query = session.createQuery("Select u FROM Document u WHERE u.course.id = :id");
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