package com.blusky.www.daoimpl;

import javax.inject.Inject;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.blusky.www.Idao.TestDaoI;
import com.blusky.www.bean.TestBean;

@Repository("testDao")
public class TestDaoImpl implements TestDaoI{

	
	@Inject
	SessionFactory sf;
	

	public void save(TestBean tb) {
		// TODO Auto-generated method stub
		sf.getCurrentSession().save(tb);
	}

}
