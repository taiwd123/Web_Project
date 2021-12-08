package dao.impl;

import dao.GenericDAO;
import entity.Account;
import entity.Question;
import org.apache.commons.lang.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import paging.Pageble;
import util.HibernateUtil;

import java.lang.reflect.ParameterizedType;
import java.util.List;

public class AbstractDAO<T> implements GenericDAO<T> {
    private Class<T> tempClass;

    public AbstractDAO() {
        this.tempClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

    public String getNameClass() {
        return this.tempClass.getSimpleName();
    }

    @Override
    public boolean insert(T obj) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.getTransaction().begin();
            T temp = obj;
            session.persist(temp);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            session.getTransaction().rollback();
            return false;
        } finally {
            session.close();
        }
    }

    @Override
    public T update(T obj) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        T result = null;
        try {
            session.merge(obj);
            session.getTransaction().commit();
            result = obj;
        } catch (Exception e) {
            System.out.print("Loi");
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return result;
    }

    @Override
    public boolean delete(T obj) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        try {
            session.remove(session.merge(obj));
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.out.print("Loi");
            session.getTransaction().rollback();
            return false;
        } finally {
            session.close();
        }
    }

    @Override
    public List<T> findAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<T> result = null;
        try {
            StringBuilder sqlquery = new StringBuilder("FROM ");
            sqlquery.append(this.getNameClass());
            Query<T> query = session.createQuery(sqlquery.toString());
            result = query.list();
            return result;
        } catch (Exception e) {
            session.getTransaction().rollback();
            System.out.println("loi");
        } finally {
            session.close();
        }
        return result;
    }


    @Override
    public T findById(Integer id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        T result = null;
        try {
            result = (T) session.get(this.tempClass, id);
        } catch (Exception e) {
            session.getTransaction().rollback();
            System.out.println("loi");
        } finally {
            session.close();
        }
        return result;
    }

    @Override
    public List<T> findAll(Pageble pageble, Integer examID) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        List<T> result = null;
        StringBuilder sql = new StringBuilder("Select u FROM ");
        sql.append(this.getNameClass());
        sql.append(" u WHERE u.exam.id = :id");
        if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
            sql.append(" ORDER BY u." + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }

        try {

            Query<T> query = session.createQuery(sql.toString());
            query.setParameter("id", examID);
            if (pageble.getOffset() != null && pageble.getLimit() != null) {
                query.setFirstResult(pageble.getOffset());
                query.setMaxResults(pageble.getLimit());
            }

            if (query.list().size() != 0) {
                result = query.getResultList();
            }
        } catch (Exception e) {
            System.out.println(e.toString());
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return result;

    }
}
