package com.blusky.www.Iservice;


import javax.servlet.http.HttpServletRequest;

import com.blusky.www.bean.UserBean;

public interface UserServiceI extends BaseServiceI<UserBean>{
	boolean validateUser(String parameter1, String parameter2,HttpServletRequest request);


}
