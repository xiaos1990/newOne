package com.blusky.www.test;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.blusky.www.Iservice.TestSerivceI;

public class TestClass {

	public static ApplicationContext ac;
	//test spring configuration
	@BeforeClass
	public static void loadConfig(){
		  //通过spring.xml配置文件创建Spring的应用程序上下文环境
		        ac = new ClassPathXmlApplicationContext("classpath:spring.xml");
		       
		       
	}
	
	@Test
	public void testSpring(){
		  //从Spring的IOC容器中获取bean对象
		  TestSerivceI testService = (TestSerivceI) ac.getBean("testService");
	         //执行测试方法
		  testService.testMethod();
	}
	
}
