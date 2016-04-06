package com.blusky.www.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.SessionFactory;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.blusky.www.Iservice.TestServiceI;
import com.blusky.www.bean.TestBean;

@Controller
@RequestMapping("/ajax")
public class AjaxAction {
	@Inject  
	private  HttpServletRequest request;  
	
	@Inject
	MessageSource messageSource;
	@Inject
	TestServiceI testService;
	
	@Inject
	SessionFactory sf;
	
	@RequestMapping("/getStates")
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
	
/*	@Transactional
	@RequestMapping(value="/signup",method=RequestMethod.POST)
	public String signupAction(
	   @ModelAttribute("UserBean")
	   @Valid UserBean user,
	   BindingResult bindingResult)throws Exception{	
	        if(bindingResult.hasErrors()){
			return "homepage";
	         }else{
	 			try{
					sf.getCurrentSession().saveOrUpdate(user);
					return "forward:/home/page";
				}catch(Exception ex){
					ex.printStackTrace();
					return "forward:/home/page";
				}
	         }
	}
*/
}
