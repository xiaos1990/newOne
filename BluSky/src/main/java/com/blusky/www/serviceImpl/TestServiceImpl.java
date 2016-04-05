package com.blusky.www.serviceImpl;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blusky.www.Idao.BaseDaoI;
import com.blusky.www.Idao.TestDaoI;
import com.blusky.www.Iservice.TestServiceI;
import com.blusky.www.bean.TestBean;

@Service("testService")
public class TestServiceImpl extends BaseServciceImpl<TestBean> implements TestServiceI {
	
	@Resource
	TestDaoI testDao;
	
	@Resource(name="testDao")
	public void setDao(BaseDaoI<TestBean> dao) {
		super.setDao(dao);		
	};
	@Transactional
	public void testMethod() {
		// TODO Auto-generated method stub
		System.out.println("Hello World");
		TestBean tb = new TestBean();
		tb.setRequest("123");
		tb.setResponse("1234");
		testDao.save(tb);
		
	}

}
