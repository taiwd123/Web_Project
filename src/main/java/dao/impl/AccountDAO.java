package dao.impl;

import dao.IAccountDAO;
import entity.Account;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import util.HibernateUtil;

import java.util.List;

public  class AccountDAO extends AbstractDAO<Account> implements IAccountDAO {
    @Override
    public Account findByUsernamePassword(String username, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Account result = null;
        try {
            Query<Account> query = session.createQuery("SELECT account FROM Account account WHERE account.username = :user and account.pass = :pass");
            query.setParameter("user", username);
            query.setParameter("pass", password);
            if(query.list().size() != 0){
                result = query.getSingleResult();
            }
        }catch (Exception e) {
            session.getTransaction().rollback();
        }finally {
            session.close();
        }
        return result;
    }

    @Override
    public Account findByEmail(String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Account result = null;
        try {
            Query<Account> query = session.createQuery("SELECT account FROM Account account WHERE account.email = :mail");
            query.setParameter("mail", email);
            if(query.list().size() != 0){
                result = query.getSingleResult();
            }
        }catch (Exception e) {
            session.getTransaction().rollback();
        }finally {
            session.close();
        }
        return result;
    }

    @Override
    public Integer countTotalStudent(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Integer result = null;
        try {
            Query<Account> query = session.createQuery("SELECT account FROM Account account WHERE account.roleid.id = 2 and account.active = true ");
            result = query.list().size();
        }catch (Exception e) {
            session.getTransaction().rollback();
        }finally {
            session.close();
        }
        return result;
    }

    @Override
    public Integer resetPassword(String email, String newPassword) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Integer result = null;
        try {
            Transaction txn = session.beginTransaction();
            String hql = "UPDATE Account a SET a.pass = ?1, a.passreset = ?2 WHERE a.email = ?3";
            Query query = session.createQuery(hql);
            query.setParameter(1, newPassword);
            query.setParameter(2, null);
            query.setParameter(3, email);
            result = query.executeUpdate();
            txn.commit();
            System.out.println("success");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return result;
    }
    @Override
    public Account findByUsername(String username) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Account result = null;
        try {
            Query<Account> query = session.createQuery("SELECT account FROM Account account WHERE account.username = :user");
            query.setParameter("user", username);
            if(query.list().size() != 0){
                result = query.getSingleResult();
            }
        }catch (Exception e) {
            session.getTransaction().rollback();
        }finally {
            session.close();
        }
        return result;
    }

}
