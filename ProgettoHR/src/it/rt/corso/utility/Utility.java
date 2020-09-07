package it.rt.corso.utility;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import it.rt.corso.beans.Candidato;

/**
 * 
 * Class that contains methods used to handle hibernate connection to database
 * 
 */
public class Utility {

	private static SessionFactory factory;
	private static Session session;

	/**
	 * 
	 * Build an hibernate session to connect to database
	 * 
	 * @return the builded session
	 * 
	 */
	public static Session buildSession() {
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();

		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();

		factory = meta.getSessionFactoryBuilder().build();
		session = factory.openSession();

		return session;
	}

	/**
	 * 
	 * Build an hibernate session if a session has not been previuosly built
	 * 
	 * @return the builded session
	 * 
	 */
	public static Session getSession() {
		if (session == null) {
			session = buildSession();
		}

		return session;
	}

	/**
	 * 
	 * Destroy the current session
	 * 
	 */
	public static void destroySession() {
		factory.close();
		session.close();
	}

	
}
