package com.blusky.www.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blusky.www.constant.CommonConstant;


public class CheckUserStatusFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		String uri = req.getRequestURI();
	    if(uri.matches("^(/BluSky)((/image)|(/fonts)|(/files)|(/js)|(/css))/.*$")||uri.matches("^/BluSky/property/(search|display).*$")){
			chain.doFilter(req, resp);
			return;
			}
		//uri=uri.replace("/BluSky", "");
		req.getSession().setAttribute(CommonConstant.FORWARD_PAGE, uri);
		System.out.println(uri);
	
			Object user = req.getSession().getAttribute(CommonConstant.SESSION_USER);
			if(user==null){
				//req.getRequestDispatcher(req.getContextPath()+"/page/signin.jsp").forward(req, resp); 
				resp.sendRedirect(req.getContextPath()+"/page/signin.jsp");
				return;
			}else{
				chain.doFilter(req, resp);
				return;
			}			
}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
}
