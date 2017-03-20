package com.ymai.struts.filter;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.*; 

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.StaleObjectStateException;

import com.ymai.hibernate.City;
import com.ymai.hibernate.HibernateSessionFactory;
import com.ymai.hibernate.User;
import com.ymai.struts.action.MapFacade;
import com.ymai.struts.action.user.UserValidate;

public class UrlFilter implements Filter{

	 //private static Log log = LogFactory.getLog(HibernateSessionRequestFilter.class);
	 
		
	 
	    public void doFilter(ServletRequest request,
	                         ServletResponse response,
	                         FilterChain chain)
	            throws IOException, ServletException {
	    	
	    		chain.doFilter(request, response);
	    }
	 
	    public void init(FilterConfig filterConfig) throws ServletException {
	       
	    }
	 
	    public void destroy() {}

}


