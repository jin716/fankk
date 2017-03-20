package com.ymai.struts.filter;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.*; 

import com.ymai.hibernate.User;
import com.ymai.struts.action.user.UserValidate;

public class RememberMeFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) arg0;
		User c_user = UserValidate.getUser(request);
		Cookie cookies[] = request.getCookies();
		System.out.println("###########");
		for (int i = 0; i < cookies.length; i++) {
			System.out.println(cookies[i].getName()+" "+cookies[i].getValue());
		}
		if(c_user==null){
			//Cookie cookies[] = request.getCookies();
			String user = null;
			String pass = null;
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					System.out.println(cookies[i].getName());
					if(cookies[i].getName().equals("user")){
						user = cookies[i].getValue();
						continue;
					}
					if(cookies[i].getName().equals("pass")){
						pass = cookies[i].getValue();
						continue;
					}
				}
				if(user!=null&&pass!=null){
					c_user = UserValidate.login(request, user, pass);
					UserValidate.setUser(request, c_user);
				}
			}
		}
		arg2.doFilter(arg0, arg1);
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}


