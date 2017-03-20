/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.ymai.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ymai.struts.action.user.UserFacade;

/** 
 * MyEclipse Struts
 * Creation date: 07-06-2010
 * 
 * XDoclet definition:
 * @struts.action path="/advise" name="adviseForm" input="/form/advise.jsp" scope="request"
 */
public class AdviseAction extends Action {
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
		try {
			AdviseForm f = (AdviseForm) form;
			
			if(f.getAdviseContent()==null||f.getAdviseContent().trim().length() ==0){
				return mapping.findForward("error");
			}
			UserFacade.saveAdvise(form);
			return mapping.findForward("ok");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		
	}
}