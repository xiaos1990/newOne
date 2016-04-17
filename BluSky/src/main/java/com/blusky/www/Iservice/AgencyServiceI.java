package com.blusky.www.Iservice;


import javax.servlet.http.HttpServletRequest;

import com.blusky.www.bean.UserBean;

public interface AgencyServiceI extends BaseServiceI<UserBean>{
	boolean validateAgency(String parameter1, String parameter2,HttpServletRequest request);


}
