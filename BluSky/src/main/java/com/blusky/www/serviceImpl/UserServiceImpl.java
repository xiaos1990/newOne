package com.blusky.www.serviceImpl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blusky.www.Idao.BaseDaoI;
import com.blusky.www.Idao.UserDaoI;
import com.blusky.www.Iservice.UserServiceI;
import com.blusky.www.bean.UserBean;
import com.blusky.www.constant.CommonConstant;

@Service("userService")
@Transactional
public class UserServiceImpl extends BaseServciceImpl<UserBean> implements UserServiceI {
	
	UserDaoI userDao;
	
	@Resource(name="userDao")
	public void setDao(BaseDaoI<UserBean> dao) {
		super.setDao(dao);	
		userDao=(UserDaoI) dao;
	}
	
	
	@Override
	public boolean validateUser(String parameter1, String parameter2,HttpServletRequest request) {

		Object[] parameters ={parameter1};
		List<UserBean> list =findEntityByHQL("from UserBean ub where trim(ub.email)=?",parameters);
		if(list!=null&&list.size()>0){
			if(list.get(0).getPassword().trim().equals(parameter2)){
				request.getSession(false).setAttribute(CommonConstant.SESSION_USER, list.get(0));
				return true;
			}
		}
		return false;
	}
	

}
