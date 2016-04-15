package com.blusky.www.serviceImpl;

import javax.annotation.Resource;
import javax.inject.Inject;



import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blusky.www.Idao.BaseDaoI;
import com.blusky.www.Idao.TestDaoI;
import com.blusky.www.Idao.UserDaoI;
import com.blusky.www.Iservice.TestServiceI;
import com.blusky.www.Iservice.UserServiceI;
import com.blusky.www.bean.UserBean;

@Service("userService")
@Transactional
public class UserServiceImpl extends BaseServciceImpl<UserBean> implements UserServiceI {
	
	@Resource
	UserDaoI userDao;
	
	@Resource(name="userDao")
	public void setDao(BaseDaoI<UserBean> dao) {
		super.setDao(dao);		
	}

	
	

}
