package com.blusky.www.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blusky.www.Iservice.TestSerivceI;
import com.blusky.www.bean.TestBean;

@Controller
@RequestMapping("/test")
public class TestAction {
	@Inject  
	private  HttpServletRequest request;  
	
	@Inject
	TestSerivceI testService;
	
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

}
