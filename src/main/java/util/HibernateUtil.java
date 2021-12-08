package util;

import java.util.ResourceBundle;
import entity.*;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import java.util.Properties;


public class HibernateUtil {
    private final static SessionFactory FACTORY;


    static {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("db");
        Configuration conf = new Configuration();
        Properties pros = new Properties();
        pros.put(Environment.DIALECT, resourceBundle.getString("dialect"));
        pros.put(Environment.DRIVER, resourceBundle.getString("driverName"));
        pros.put(Environment.URL, resourceBundle.getString("url"));
        pros.put(Environment.USER, resourceBundle.getString("user"));
        pros.put(Environment.PASS, resourceBundle.getString("password"));
        pros.put(Environment.SHOW_SQL, resourceBundle.getString("showSQL"));

        conf.setProperties(pros);
        conf.addAnnotatedClass(Account.class);
        conf.addAnnotatedClass(Course.class);
        conf.addAnnotatedClass(Exam.class);
        conf.addAnnotatedClass(Preview.class);
        conf.addAnnotatedClass(Question.class);
        conf.addAnnotatedClass(RegisterCourse.class);
        conf.addAnnotatedClass(RoleUser.class);
        conf.addAnnotatedClass(Score.class);
        conf.addAnnotatedClass(Document.class);

        ServiceRegistry registry = new StandardServiceRegistryBuilder().applySettings(
                conf.getProperties()).build();

        FACTORY = conf.buildSessionFactory(registry);
    }

    public static  SessionFactory getSessionFactory() {
        return FACTORY;
    }
}
