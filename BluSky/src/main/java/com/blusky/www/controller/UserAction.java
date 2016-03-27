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

import com.blusky.www.Iservice.TestSerivceI;
import com.blusky.www.Iservice.UserSerivceI;
import com.blusky.www.bean.TestBean;
import com.blusky.www.bean.UserBean;

@Controller
@RequestMapping("/user")
public class UserAction {
	
	@Inject
	UserSerivceI userService;
	

	
	@Transactional
	@RequestMapping(value="/signup",method=RequestMethod.POST)
	public String signupAction(
	   @ModelAttribute("UserBean")
	   @Valid UserBean user,
	   BindingResult bindingResult)throws Exception{	
	        if(bindingResult.hasErrors()){
			return "homepage";
	         }else{
	 			try{
	 				userService.save(user);
					return "forward:/home/page";
				}catch(Exception ex){
					ex.printStackTrace();
					return "forward:/home/page";
				}
	         }
	}

}
