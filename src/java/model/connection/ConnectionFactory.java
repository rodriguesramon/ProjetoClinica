/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.connection;

import org.hibernate.Session;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.SessionFactory;

/**
 * Hibernate Utility class with a convenient method to get Session Factory
 * object.
 *
 * 
 */
public class ConnectionFactory {

    private static final SessionFactory sessionFactory;
    
    static {
        try {
            // Create the SessionFactory from standard (hibernate.cfg.xml) 
            // config file.
            sessionFactory = new AnnotationConfiguration().configure("model/connection/hibernate.cfg.xml").buildSessionFactory();
        } catch (Throwable ex) {
            // Log the exception. 
            System.err.println("Initial SessionFactory creation failed." + ex.getCause() );
            throw new ExceptionInInitializerError(ex);
        }
    }
    
    public static Session getSessionFactory() {
        return sessionFactory.openSession();
    }
}
