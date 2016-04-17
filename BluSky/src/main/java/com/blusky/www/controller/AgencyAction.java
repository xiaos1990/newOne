package com.blusky.www.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blusky.www.Iservice.AgencyServiceI;
import com.blusky.www.bean.UserBean;
import com.blusky.www.constant.CommonConstant;

@Controller
@RequestMapping("/agency")
public class AgencyAction {

	@Inject
	AgencyServiceI agencyService;

	
	@RequestMapping(value = "/create", method = RequestMethod.GET)	
	public String createAgent(ModelMap map,HttpServletRequest request){
		UserBean userBean = (UserBean) request.getSession(false).getAttribute(CommonConstant.SESSION_USER);
		if(StringUtils.isBlank(userBean.getIsAgent()) || !userBean.getIsAgent().equals("1"))
		map.put("userBean", userBean);	
		else
		return "homepage";
		return "agentsignup";
	}
	
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
			List<UserBean> list=agencyService.findEntityByHQL("from UserBean ub where ub.email=?",user.getEmail());
			if(list!=null && list.size()>0){
				mapErrors.put("email", CommonConstant.DUMPLICATE_EMAIL);
				mapErrors.put("dumplicateEmail", true);
				return mapErrors;
			}
	/*		
			agencyService.saveEntity(user);*/
			mapErrors.put("success", true);
			request.getSession(false).setAttribute(CommonConstant.SESSION_USER, user);
		} catch (Exception ex) {
			 ex.printStackTrace();
			mapErrors.put("saveFail", ex);
		}
		return mapErrors;

	}
	
	@RequestMapping(value="/signin" , method = RequestMethod.POST)
	@ResponseBody
	public  Map<String, Object> signinAction( @RequestBody UserBean user ,HttpServletRequest request,HttpServletResponse response){
		boolean valid=validateUser(user.getEmail().trim(),user.getPassword().trim(),request);
		//String value = request.getParameter("rememberMe");
		
		Map<String, Object> mapErrors = new HashMap<String, Object>();
		if(valid){
			mapErrors.put("success", true);
		}else{
			mapErrors.put("success", false);
			mapErrors.put("message", CommonConstant.WRONG_USER_INFO);
		}
		return mapErrors;
	}
	
	
	@RequestMapping(value="/signinSave" , method = RequestMethod.POST)
	public  String signinSaveAction(HttpServletRequest request,HttpServletResponse response){
		
		String value = request.getParameter("pathName").replace("/BluSky", "");
		Object forward=request.getSession(false).getAttribute(CommonConstant.FORWARD_PAGE);
		addCookieingUserToResponse(request.getParameter("email").trim(),request.getParameter("password").trim(),request,response);
		if(forward!=null)
			return "redirect:"+forward.toString();
		else
			return "redirect:"+value;
	}


	private boolean validateUser(String parameter1, String parameter2,HttpServletRequest request) {

		Object[] parameters ={parameter1};
		List<UserBean> list =agencyService.findEntityByHQL("from UserBean ub where trim(ub.email)=?",parameters);
		if(list!=null&&list.size()>0){
			if(list.get(0).getPassword().trim().equals(parameter2)){
				request.getSession(false).setAttribute("user", list.get(0));
				return true;
			}
		}
		return false;
	}
	
	
	
	@RequestMapping(value = "/signOff", method = RequestMethod.GET)	
	public  String signOffAction(HttpServletRequest request,HttpServletResponse response) throws Exception {
		removeCookieingUserInResponse(request,response);	
		request.getSession(false).removeAttribute(CommonConstant.SESSION_USER);		
		return "homepage";

	}	
		   
	    private void addCookieingUserToResponse(String email, String password, HttpServletRequest request, HttpServletResponse response){ 
	  
	        Cookie cookieEmail = new Cookie(CommonConstant.BROWSER_COOKIE_EMAIL,email); 
	        cookieEmail.setMaxAge(CommonConstant.BROWSER_COOKIE_MAX_AGE); 
	        cookieEmail.setPath(request.getContextPath()); 
	        response.addCookie(cookieEmail); 
	  
	        Cookie cookiePassword = new Cookie(CommonConstant.BROWSER_COOKIE_PASSWORD, password);     
	        cookiePassword.setMaxAge(CommonConstant.BROWSER_COOKIE_MAX_AGE); 
	        cookiePassword.setPath(request.getContextPath()); 
	        response.addCookie(cookiePassword); 
	          
	        Cookie autoLoginStatusCookie = new Cookie( 
	                CommonConstant.BROWSER_COOKIE_AUTO_STATUS_NAME, 
	                "1"); 
	        autoLoginStatusCookie 
	                .setMaxAge(CommonConstant.BROWSER_COOKIE_MAX_AGE); 
	        autoLoginStatusCookie.setPath(request 
	                .getContextPath()); 
	        response.addCookie(autoLoginStatusCookie); 
	         
	    } 
	     
	    public void removeCookieingUserInResponse(HttpServletRequest request,HttpServletResponse response){ 
 
	        Cookie cookieEmail = new Cookie(CommonConstant.BROWSER_COOKIE_EMAIL,null); 
	        cookieEmail.setMaxAge(CommonConstant.BROWSER_COOKIE_MAX_AGE); 
	        cookieEmail.setPath(request.getContextPath()); 
	        response.addCookie(cookieEmail); 
 
	        Cookie cookiePassword = new Cookie(CommonConstant.BROWSER_COOKIE_PASSWORD, null);  
	        cookiePassword.setMaxAge(CommonConstant.BROWSER_COOKIE_MAX_AGE); 
	        cookiePassword.setPath(request.getContextPath()); 
	        response.addCookie(cookiePassword); 
 
	        Cookie autoLoginStatusCookie = new Cookie(CommonConstant.BROWSER_COOKIE_AUTO_STATUS_NAME,"0"); 
	        autoLoginStatusCookie.setMaxAge(CommonConstant.BROWSER_COOKIE_MAX_AGE); 
	        autoLoginStatusCookie.setPath(request.getContextPath()); 
	        response.addCookie(autoLoginStatusCookie); 	     
	    }
}
