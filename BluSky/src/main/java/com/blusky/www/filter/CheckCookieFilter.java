package com.blusky.www.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blusky.www.Iservice.UserServiceI;
import com.blusky.www.bean.UserBean;
import com.blusky.www.constant.CommonConstant;
import com.blusky.www.utils.SpringContextUtil;


public class CheckCookieFilter implements Filter {

	public void destroy() {
	}

	 @Override 
	    public void doFilter(ServletRequest req, ServletResponse res, 
	            FilterChain chain) throws IOException, ServletException { 
	 
	        HttpServletRequest request = (HttpServletRequest) req; 
	        HttpServletResponse response = (HttpServletResponse) res; 
	        String URI = request.getRequestURI();
	        System.out.println(URI);
	        if(URI.matches("^(/BluSky)((/image)|(/fonts)|(/files)|(/js)|(/css))/.*$")){
	        	 chain.doFilter(request, response); 
	        	 return;
	        }else{
	        Object object = request.getSession().getAttribute( 
	                CommonConstant.SESSION_USER); 
	 
	        UserBean cookieUser = null; 
	        String email = null; 
	        String password = null; 
	        String autoStatus = null; 
	 
	        if (object == null) { 
	            Cookie[] cookies = request.getCookies(); 
	            if (cookies != null && cookies.length > 0) { 
	                for (int i = 0; i < cookies.length; i++) { 
	                    Cookie cookie = cookies[i]; 
	 
	                    if (CommonConstant.BROWSER_COOKIE_EMAIL.equals(cookie 
	                            .getName())) { 
	                        email = cookie.getValue().trim(); 
	                    } 
	                   
	                    
	  
	                    if (CommonConstant.BROWSER_COOKIE_PASSWORD.equals(cookie 
	                            .getName())) { 
	                        password = cookie.getValue().trim(); 
	                    } 
	 
	                   
	                    if (CommonConstant.BROWSER_COOKIE_AUTO_STATUS_NAME 
	                            .equals(cookie.getName())) { 
	                        autoStatus = cookie.getValue().trim(); 
	                    } 
	                } 
	                if (autoStatus!=null&&autoStatus.equals("1")) { 
	                    if (email != null && password != null && email.length() > 0 
	                            && password.length() > 0) { 
	                        cookieUser = new UserBean(); 
	                        cookieUser.setEmail(email); 
	                        cookieUser.setPassword(password); 	 
	                        UserServiceI userService = (UserServiceI) SpringContextUtil.getBean("userService");
	                        userService.validateUser(cookieUser.getEmail(),cookieUser.getPassword(),request);
	                    }
	                }
	            }
	        }
	        }
	            chain.doFilter(request, response); 
	            return;
	                    
	} 

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
}
