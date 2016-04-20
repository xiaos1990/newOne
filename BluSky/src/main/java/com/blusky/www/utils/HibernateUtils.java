package com.blusky.www.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HibernateUtils {

	private static SessionFactory sf=null;
	private static Session session=null;
	private static ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:spring.xml");
	public static Session getSession() {
		if(sf==null)
		sf = (SessionFactory) ac.getBean("sessionFactory");
	
		try {
			session=sf.getCurrentSession();
			if (session!= null) {
				return session;
			} else {
				session=sf.openSession();
				return session;
			}
		} catch (Exception e) {
			session=sf.openSession();
			return session;
		}

	}
}
