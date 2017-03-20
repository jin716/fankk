package com.ymai.struts.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;
import com.ymai.hibernate.HibernateSessionFactory;
import com.ymai.hibernate.Store;
import com.ymai.hibernate.User;
import com.ymai.struts.action.user.UserValidate;

public class StoreFilter implements Filter{

	 //private static Log log = LogFactory.getLog(HibernateSessionRequestFilter.class);
	 
	 
	    public void doFilter(ServletRequest arg0,
	                         ServletResponse arg1,
	                         FilterChain arg2)
	            throws IOException, ServletException {
			HttpServletRequest request = (HttpServletRequest) arg0;
			HttpServletResponse response = (HttpServletResponse) arg1;
			User user = UserValidate.getUser(request);
			Store store = UserValidate.getStore(request);
			if(user.getUserIsStore()!=true||store==null){
				response.sendRedirect(request.getContextPath()+"/user/login.jsp");
			}
			else arg2.doFilter(arg0, arg1);
	    }
	    public void destroy() {}

		public void init(FilterConfig arg0) throws ServletException {
			// TODO Auto-generated method stub
			
		}

}


