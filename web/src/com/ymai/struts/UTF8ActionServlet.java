package com.ymai.struts;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionServlet;

public class UTF8ActionServlet extends ActionServlet {
	
	protected void process(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
    {
        request.setCharacterEncoding("UTF-8"); 
        super.process(request, response);
    }

}
