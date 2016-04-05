package com.blusky.www.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.persistence.criteria.From;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.blusky.www.Iservice.UserServiceI;
import com.blusky.www.bean.UserBean;
import com.blusky.www.utils.AddressUtils;

@Controller
@RequestMapping("/user")
public class UserAction {

	@Inject
	UserServiceI userService;


/*	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> signupAction(
			@RequestBody @ModelAttribute("UserBean") @Valid UserBean user,
			BindingResult bindingResult) throws Exception {
		// Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> mapErrors = new LinkedHashMap<String, Object>();
		if (bindingResult.hasErrors()) {
			List<FieldError> errs = bindingResult.getFieldErrors();

			for (FieldError err : errs) {
				mapErrors.put(err.getField(), err.getDefaultMessage());
			}
			mapErrors.put("success", false);
			// result.put("errors", mapErrors);
			return mapErrors;
		}
		mapErrors.put("success", true);
		try {
			userService.save(user);

		} catch (Exception ex) {
			 ex.printStackTrace();
			mapErrors.put("saveFail", ex);

		}
		return mapErrors;

	}*/

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signupAction(
			 @ModelAttribute("UserBean") @Valid UserBean user,
			BindingResult bindingResult) throws Exception {
		try{
			
		if (bindingResult.hasErrors()) {		
			return "signup";
		}else		
			userService.save(user);
			return "forward:/property/display";
		} catch (Exception ex) {
			 ex.printStackTrace();
			 bindingResult.reject("hibernateError",ex.getMessage());
			 return "signup";
		}
	

	}
	
	@RequestMapping(value="/register" , method = RequestMethod.GET)
	public String registerAction(ModelMap map,HttpServletRequest request){
		map.addAttribute("UserBean", new UserBean());
		List<Map<String, String>> results = AddressUtils.getUSStates();
		request.getSession(true).setAttribute("USstates", results);
		return "signup";	
	}
	
	@RequestMapping(value="/signin" , method = RequestMethod.POST)
	public String signinAction(ModelMap map,HttpServletRequest request){
		//simple validate frist!!!!
		List<UserBean> list=validateUser(request.getParameter("email"),request.getParameter("password"));
		if(list!=null && list.size()>1)
			request.getSession(true).setAttribute("user", list.get(0));
		else{
			return "signin";
		}
		String forwardPage=request.getSession().getAttribute("forwardPage").toString();
		//System.out.println(forwardPage);
		return ("redirect:"+forwardPage.split("BluSky")[1]);	
	}

	private List<UserBean> validateUser(String parameter, String parameter2) {
		// TODO Auto-generated method stub
		Object[] parameters ={parameter,parameter2};
		List<UserBean> list =userService.findEntityByHQL("from UserBean ub where ub.email=? and ub.password=?",parameters);
		return list;
	}

}
