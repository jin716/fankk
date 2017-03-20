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

public class UserLoginFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		User user = UserValidate.getUser(request);
		if(UserValidate.isLogin(request) == false ||
				!user.getUserState().equals(User.STATE_ACTIVE)){
			request.getSession().setAttribute("mess", "请重新登录");
			response.sendRedirect(request.getContextPath()+"/user/login.jsp");
		}
		else arg2.doFilter(arg0, arg1);
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}


