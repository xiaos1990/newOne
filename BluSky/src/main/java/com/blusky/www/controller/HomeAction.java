package com.blusky.www.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.blusky.www.bean.UserBean;


@Controller
@RequestMapping("/home")
public class HomeAction {

	@RequestMapping("/page")
	public String testAction(ModelMap map){
		map.addAttribute("UserBean", new UserBean());
		System.out.println("123");
		return "homepage";	
	}
	
}
