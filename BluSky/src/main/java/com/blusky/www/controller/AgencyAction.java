package com.blusky.www.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
import com.blusky.www.Iservice.UserServiceI;
import com.blusky.www.bean.UserBean;
import com.blusky.www.constant.CommonConstant;


@Controller
public class AgencyAction {

	@Inject
	AgencyServiceI agencyService;
	@Inject
	UserServiceI userService;
	
	@RequestMapping(value = "/agencycreate", method = RequestMethod.GET)	
	public String createAgent(ModelMap map,HttpServletRequest request){
		Object object = request.getSession().getAttribute(CommonConstant.SESSION_USER);
		UserBean userBean;
		if(object!=null){
		userBean=(UserBean)object;
		if(StringUtils.isBlank(userBean.getIsAgent()) || !userBean.getIsAgent().equals("1"))
		map.put("userBean", userBean);	
		else
		return "homepage";
		return "agentsignup";
		}
		return "signin";
	}
	

	@RequestMapping(value = "/agencysignup", method = RequestMethod.POST)	
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
				mapErrors.put("email", CommonConstant.DUMPLICATE_EMAIL);
				mapErrors.put("dumplicateEmail", true);
				return mapErrors;
			}
			
			userService.saveEntity(user);
			mapErrors.put("success", true);
			request.getSession().setAttribute(CommonConstant.SESSION_USER, user);
		} catch (Exception ex) {
			 ex.printStackTrace();
			mapErrors.put("saveFail", ex);
		}
		return mapErrors;

	}
	
/*	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)	
	@ResponseBody
	public  Map<String, Object> signupAction(
			@RequestBody  @Valid UserBean user,
			BindingResult bindingResult) throws Exception {
		Map<String, Object> mapErrors = new HashMap<String, Object>();
		mapErrors.put("success", false);
		if (bindingResult.hasErrors()) {
			List<FieldError> errs = bindingResult.getFieldErrors();
			if (errs.size() == 1 && errs.get(0).getField().equals("password")) {
				mapErrors.put("success", true);
				return mapErrors;
			} else {
				for (FieldError err : errs) {
					mapErrors.put(err.getField(), err.getDefaultMessage());
				}
			}
		}
		return mapErrors;
	}*/

}
