package com.blusky.www.serviceImpl;

import javax.annotation.Resource;
import javax.inject.Inject;



import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blusky.www.Idao.BaseDaoI;
import com.blusky.www.Idao.TestDaoI;
import com.blusky.www.Idao.UserDaoI;
import com.blusky.www.Iservice.TestSerivceI;
import com.blusky.www.Iservice.UserSerivceI;
import com.blusky.www.bean.UserBean;

@Service("userService")
public class UserServiceImpl extends BaseServciceImpl<UserBean> implements UserSerivceI {
	
	@Resource
	UserDaoI userDao;
	
	@Resource(name="userDao")
	public void setDao(BaseDaoI<UserBean> dao) {
		super.setDao(dao);		
	};
	@Transactional
	public void save(UserBean ub) {
		// TODO Auto-generated method stub
		System.out.println("Hello World");
		userDao.save(ub);
		
	}

}
