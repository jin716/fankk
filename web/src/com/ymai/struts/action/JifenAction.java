/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.ymai.struts.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ymai.hibernate.Duihuan;
import com.ymai.hibernate.Gift;
import com.ymai.hibernate.User;
import com.ymai.struts.action.user.UserValidate;

/** 
 * MyEclipse Struts
 * Creation date: 08-10-2010
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class JifenAction extends Action {
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
		String giftIdStr = request.getParameter("gift");
		if(giftIdStr == null){
			Session session = ActionFacade.session();
			List all = session.createSQLQuery("select * from gift").addEntity(Gift.class).list();
			request.setAttribute("list", all);
			return mapping.findForward("list");
		}
		if(giftIdStr != null){
			User user = UserValidate.getUser(request);
			if(user == null) return mapping.findForward("noUser");
			String numStr = request.getParameter("num");
			Integer giftId = Integer.valueOf(giftIdStr);
			if(numStr == null){
				Session session = ActionFacade.session();
				Gift gift = (Gift) session.get(Gift.class, giftId);
				request.setAttribute("gift", gift);
				return mapping.findForward("detail");
			}
			else{
				Integer num = Integer.valueOf(numStr);
				String detail = request.getParameter("detail");
				Duihuan duihuan = new Duihuan();
				Session session = ActionFacade.newSession();
				Gift g = (Gift) session.get(Gift.class, giftId);
				if(user.getUserJifen()<g.getGiftJifen()*num)return mapping.findForward("jifenError");
				User u = (User) session.get(User.class, user.getUserId());
				Transaction tran = null;
				try{
					tran = session.beginTransaction();
					tran.begin();
					duihuan.setDetail(detail);
					duihuan.setNum(num);
					duihuan.setTime(new Date());
					duihuan.setGift(g);
					duihuan.setUser(u);
					duihuan.setState(Duihuan.STATE_SHENQING);
					duihuan.setJifen(g.getGiftJifen()*num);
					session.save(duihuan);
					tran.commit();
					session.close();
					return mapping.findForward("duihuanOk");
				}catch(Exception e){
					tran.rollback();
					return mapping.findForward("duihuanError");
				}
			}
		}
		return null;
	}
	
}