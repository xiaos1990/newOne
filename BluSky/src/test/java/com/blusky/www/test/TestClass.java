package com.blusky.www.test;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.blusky.www.Idao.BaseDaoI;
import com.blusky.www.daoimpl.BaseDaoImpl;
import com.blusky.www.serviceImpl.BaseServciceImpl;
import com.blusky.www.serviceImpl.PropertyServiceImpl;

public class TestClass {

	public static ApplicationContext ac;

	// test spring configuration
	@BeforeClass
	public static void loadConfig() {
		// 通过spring.xml配置文件创建Spring的应用程序上下文环境
		ac = new ClassPathXmlApplicationContext("classpath:spring.xml");

	}

	@Test
	public void testSpring() {
		// 从Spring的IOC容器中获取bean对象
		BaseDaoI<TestClass> bs = new BaseDaoImpl<TestClass>();
		// 执行测试方法
		/* testService.testMethod(); */

		List<Map> list = new ArrayList<Map>();

		list = bs
				.findListBySQL(
						"SELECT PB.ADDRESS,PB.CITY,PB.STATES,PB.ZIPCODE,FILES.ADDRESS AS ADDRESS1 from Property_Bean pb INNER JOIN UPLOADFILES FILES ON FILES.PROPERTY_ID=PB.PROPERTY_ID where rownum<3  ",
						null, null);

		final OutputStream out = new ByteArrayOutputStream();
		final ObjectMapper mapper = new ObjectMapper();
		try {
			mapper.writeValue(out, list);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject json = new JSONObject();
		JSONArray jArray = new JSONArray();
		jArray = JSONArray.fromObject(out);
		json.put("jsonObject", jArray);
		System.out.println(json.toString());
	}

}
