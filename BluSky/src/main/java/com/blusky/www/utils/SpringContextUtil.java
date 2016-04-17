package com.blusky.www.utils;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringContextUtil {
		public static Object getBean(String beanName) {
			@SuppressWarnings("resource")
			ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:spring.xml");
			Object object = ac.getBean(beanName);
			if(object!=null)
			return object;
			else 
			return null;
	}
}
