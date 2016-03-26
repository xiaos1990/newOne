package com.blusky.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestAction {
	
	@RequestMapping("/action")
	public String testAction(){
		
	System.out.println("okay");	
		return "test";
		
	}

}
