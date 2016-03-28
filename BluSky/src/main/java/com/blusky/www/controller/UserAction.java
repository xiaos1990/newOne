package com.blusky.www.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
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

	@Transactional
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
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

	}

}
