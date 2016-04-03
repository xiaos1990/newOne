package com.blusky.www.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HibernateUtils {

	private static SessionFactory sf;

	public static Session getSession() {
		ApplicationContext ac = new ClassPathXmlApplicationContext(
				"classpath:spring.xml");
		sf = (SessionFactory) ac.getBean("sessionFactory");
		try {
			if (sf.getCurrentSession() != null) {
				return sf.getCurrentSession();
			} else {
				return sf.openSession();
			}
		} catch (Exception e) {
			return sf.openSession();
		}

	}
}
