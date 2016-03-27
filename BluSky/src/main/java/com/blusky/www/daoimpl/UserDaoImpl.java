package com.blusky.www.daoimpl;

import javax.inject.Inject;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.blusky.www.Idao.UserDaoI;
import com.blusky.www.bean.UserBean;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<UserBean> implements UserDaoI{

	
	@Inject
	SessionFactory sf;
	

	public void save(UserBean userBean) {
		// TODO Auto-generated method stub
		sf.getCurrentSession().save(userBean);
	}

}
