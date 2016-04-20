package com.blusky.www.utils;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.blusky.www.constant.CommonConstant;

@SuppressWarnings("serial")
public class StartupServlet extends HttpServlet {

	public void init() throws ServletException {
	    ServletContext sc = getServletContext();  
	    sc.setAttribute(CommonConstant.AMENITIES, RefTableUtils.getListBySql("AMENITIES"));
	    sc.setAttribute(CommonConstant.LEASE_DETAILS, RefTableUtils.getListBySql("LEASE_DETAILS"));
	    sc.setAttribute(CommonConstant.PROPERTY_TYPE_BUYER, RefTableUtils.getListBySql("PROPERTY_TYPE_BUYER"));
	    sc.setAttribute(CommonConstant.PROPERTY_TYPE_OWNER, RefTableUtils.getListBySql("PROPERTY_TYPE_OWNER"));
	    sc.setAttribute(CommonConstant.PROPERTY, RefTableUtils.getListBySql("PROPERTY"));
	    sc.setAttribute(CommonConstant.QUALITY, RefTableUtils.getListBySql("QUALITY")); 
	    sc.setAttribute(CommonConstant.STATES,  AddressUtils.getUSStates()); 
	   
	}
}
