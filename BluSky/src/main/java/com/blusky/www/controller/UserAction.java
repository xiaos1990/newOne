package com.blusky.www.controller;

import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.validation.Valid;

import org.python.modules.newmodule;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blusky.www.Iservice.UserSerivceI;
import com.blusky.www.bean.UserBean;

@Controller
@RequestMapping("/user")
public class UserAction {

	@Inject
	UserSerivceI userService;


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
			return "home";
		} catch (Exception ex) {
			 ex.printStackTrace();
			 bindingResult.reject("hibernateError",ex.getMessage());
			 return "signup";
		}
	

	}
	
	@RequestMapping(value="/register" , method = RequestMethod.GET)
	public String testAction(ModelMap map){
		map.addAttribute("UserBean", new UserBean());
		return "signup";	
	}

}
