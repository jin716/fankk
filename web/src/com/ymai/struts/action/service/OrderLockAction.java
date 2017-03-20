/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.ymai.struts.action.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ymai.hibernate.Admin;
import com.ymai.struts.action.ordersystem.OSFacade;

/** 
 * MyEclipse Struts
 * Creation date: 08-05-2010
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class OrderLockAction extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		try{
			Admin admin = (Admin) request.getSession().getAttribute("c_admin");
			if(!AdminPower.power(admin, AdminPower.ORDER))return null;
			Integer oid = Integer.valueOf(request.getParameter("order"));
			OSFacade.lockOrder(oid, admin.getAdminId());
			return null;
		}catch(Exception e){
			
		}
		return null;
	}
}