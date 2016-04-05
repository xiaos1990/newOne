package com.blusky.www.controller;

import java.io.InputStream;
import java.util.Locale;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.hibernate.SessionFactory;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.blusky.www.Iservice.TestServiceI;
import com.blusky.www.bean.TestBean;
import com.blusky.www.bean.UserBean;

@Controller
@RequestMapping("/test")
public class TestAction {
	@Inject  
	private  HttpServletRequest request;  
	
	@Inject
	MessageSource messageSource;
	@Inject
	TestServiceI testService;
	
	@Inject
	SessionFactory sf;
	
	@RequestMapping("/display")
	public String testAction(ModelMap map){
		StringBuffer sBuffer= new StringBuffer();
		sBuffer.append("from TestBean tb");
		TestBean tBean= (TestBean) testService.findEntityByHQL(sBuffer.toString(), null).get(0);
		tBean = (TestBean) request.getAttribute("testBean");
		map.addAttribute("testBean",tBean);		
		System.out.println("okay");	
		return "test";
		
	}
	
	@RequestMapping("/forward")
	public String forwardAction(TestBean tBean){
		tBean = (TestBean) request.getAttribute("testBean");
		tBean.setRequest("11111111111");
		request.getAttribute("modelMap");
		System.out.println(request.getRemoteAddr());
		//map.addAttribute("testBean",tBean);		
		System.out.println("okay");	
		return "test";
		
	}
	
/*	@Transactional
	@RequestMapping(value="/signup",method=RequestMethod.POST)
	public String signupAction(
	   @ModelAttribute("UserBean")
	   @Valid UserBean user,
	   BindingResult bindingResult)throws Exception{	
	        if(bindingResult.hasErrors()){
			return "homepage";
	         }else{
	 			try{
					sf.getCurrentSession().saveOrUpdate(user);
					return "forward:/home/page";
				}catch(Exception ex){
					ex.printStackTrace();
					return "forward:/home/page";
				}
	         }
	}
*/
}
