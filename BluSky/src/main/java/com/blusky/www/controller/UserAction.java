package com.blusky.www.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blusky.www.Iservice.UserServiceI;
import com.blusky.www.bean.UserBean;
import com.blusky.www.utils.AddressUtils;

@Controller
@RequestMapping("/user")
public class UserAction {

	@Inject
	UserServiceI userService;


	@RequestMapping(value = "/signup", method = RequestMethod.POST)	
	@ResponseBody
	public  Map<String, Object> signupAction(
			@RequestBody @Valid UserBean user,
			BindingResult bindingResult,HttpServletRequest request) throws Exception {
		Map<String, Object> mapErrors = new HashMap<String, Object>();
		mapErrors.put("success", false);
		mapErrors.put("dumplicateEmail", false);
		if (bindingResult.hasErrors()) {
			List<FieldError> errs = bindingResult.getFieldErrors();

			for (FieldError err : errs) {
				mapErrors.put(err.getField(), err.getDefaultMessage());
			}
			return mapErrors;
		}
		try {
			List<UserBean> list=userService.findEntityByHQL("from UserBean ub where ub.email=?",user.getEmail());
			if(list!=null && list.size()>0){
				mapErrors.put("email", "This email is registered!");
				mapErrors.put("dumplicateEmail", true);
				return mapErrors;
			}
			
			userService.saveEntity(user);
			mapErrors.put("success", true);
			request.getSession(false).setAttribute("user", user);
		} catch (Exception ex) {
			 ex.printStackTrace();
			mapErrors.put("saveFail", ex);
		}
		return mapErrors;

	}
	
	
	
	@RequestMapping(value = "/signOff", method = RequestMethod.GET)	
	@ResponseBody
	public  Map<String, Object> signOffAction(HttpServletRequest request) throws Exception {
		Map<String, Object> mapErrors = new HashMap<String, Object>();		
		request.getSession(false).removeAttribute("user");		
		return mapErrors;

	}


	
	@RequestMapping(value="/signin" , method = RequestMethod.POST)
	@ResponseBody
	public String signinAction(@RequestBody UserBean user ,HttpServletRequest request){
		//simple validate frist!!!!
		List<UserBean> list=validateUser(request.getParameter("email"),request.getParameter("password"));
		if(list!=null && list.size()>1)
			request.getSession(true).setAttribute("user", (UserBean)list.get(0));
		else{
			return "signin";
		}
		String forwardPage=request.getSession().getAttribute("forwardPage").toString();
		//System.out.println(forwardPage);
		return ("redirect:"+forwardPage.split("BluSky")[1]);	
	}
/*	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signupAction(
			 @ModelAttribute("UserBean") @Valid UserBean user,
			BindingResult bindingResult,HttpServletRequest request) throws Exception {
		try{
			
		if (bindingResult.hasErrors()) {		
			return "signup";
		}else	{
			userService.saveEntity(user);
			return "forward:/property/display";
		} }catch (Exception ex) {
			 ex.printStackTrace();
			 bindingResult.reject("hibernateError",ex.getMessage());
			 return "signup";
		}
	

	}
	*/
	@RequestMapping(value="/register" , method = RequestMethod.GET)
	public String registerAction(ModelMap map,HttpServletRequest request){
		map.addAttribute("UserBean", new UserBean());
		List<Map<String, String>> results = AddressUtils.getUSStates();
		request.getSession(true).setAttribute("USstates", results);
		return "signup";	
	}
	


	private List<UserBean> validateUser(String parameter, String parameter2) {
		// TODO Auto-generated method stub
		Object[] parameters ={parameter,parameter2};
		List<UserBean> list =userService.findEntityByHQL("from UserBean ub where ub.email=? and ub.password=?",parameters);
		return list;
	}

}
