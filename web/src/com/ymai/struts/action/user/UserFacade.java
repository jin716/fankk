package com.ymai.struts.action.user;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;

import com.ymai.hibernate.AdminUser;
import com.ymai.hibernate.HibernateSessionFactory;
import com.ymai.hibernate.Liuyan;
import com.ymai.hibernate.Order;
import com.ymai.hibernate.Store;
import com.ymai.hibernate.StoreApply;
import com.ymai.hibernate.StoreComnt;
import com.ymai.hibernate.User;
import com.ymai.sms.SMSSendError;
import com.ymai.sms.SMSSender;
import com.ymai.sms.SMSSenderFactory;
import com.ymai.struts.Page;
import com.ymai.struts.action.AdviseForm;
import com.ymai.tools.MyMath;

public class UserFacade {
	
	//手机验证码在session中的key值
	public final static String KEY_ACTIVE_CODE = "KEY_ACTIVE_CODE";
	//手机验证码在session中已被配对的次数，多于5次就要重新生成验证码
	public final static String KEY_ACTIVE_CODE_CHECK_NUM = "KEY_ACTIVE_CODE_CHECK_NUM";
	public final static String KEY_ACTIVE_CODE_LAST_SEND = "KEY_ACTIVE_CODE_LAST_SEND";

	public static void activeCurrentUser(HttpServletRequest request) throws Exception{
		User user = UserValidate.getUnactiveUser(request);
		Session session = HibernateSessionFactory.getSession();
		user = (User) session.load(User.class, user.getUserId());
		Transaction tran = null;
		try{
			tran = session.beginTransaction();
			tran.begin();
			user.setUserState(User.STATE_ACTIVE);
			session.update(user);
			tran.commit();
			session.close();
			UserValidate.setUser(request, user);
		}catch(Exception e){
			tran.rollback();
			throw new Exception("系统故障");
		}finally{
			if(session.isOpen())session.close();
		}
	}
	
	public static String sendAcitveCode(HttpServletRequest request,BigInteger tele) throws Exception{
		HttpSession session = request.getSession();
		String ac = (String) session.getAttribute(KEY_ACTIVE_CODE);
		if(ac!=null){
			Date time = (Date) session.getAttribute(KEY_ACTIVE_CODE_LAST_SEND);
			Long now = new Date().getTime();
			Long last = time.getTime();
			int interval =  now.intValue() - last.intValue();
			if(interval < SMSSenderFactory.INTERVAL)return ac;
		}
		if(ac==null){
			StringBuffer sb = new StringBuffer();
			for(int i = 0 ; i < 6 ; ++i){
				Integer acode = ((Double)(10 * Math.random())).intValue();
				sb.append(acode);
			}
			ac =sb.toString();
			session.setAttribute(KEY_ACTIVE_CODE, ac);
			session.setAttribute(KEY_ACTIVE_CODE_LAST_SEND, new Date());
		}//TODO
		
		try{
			SMSSender sms = SMSSenderFactory.getInstance();
			sms.sendActiveCode(ac, tele.toString());
		}catch(SMSSendError e){
			throw new Exception("发送失败，请重新发送");
		}
		//send acode to telephone
		return ac;
	}
	
	public static void changeTeleNum(HttpServletRequest request) throws Exception{
		User user = UserValidate.getUser(request);
		if(!user.getUserState().equals(User.STATE_UN_ACTIVATE))return;
		Session sess = HibernateSessionFactory.getSession();
		Transaction tran = null;
		try{
			tran = sess.beginTransaction();
			tran.begin();
			User a_user = (User) sess.load(User.class, user.getUserId());
			sess.delete(a_user);
			tran.commit();
			UserValidate.setUser(request, user);
		}catch(Exception e){
			e.printStackTrace();
			tran.rollback();
			throw e;
		}finally{
			if(sess.isOpen())sess.close();
		}
	}
	
	
	public static String getAcitveCode(HttpServletRequest request){
		return (String) request.getSession().getAttribute(KEY_ACTIVE_CODE);
	}
	
	public static void clearAcitveCode(HttpServletRequest request){
		request.getSession().removeAttribute(KEY_ACTIVE_CODE);
	}
	
	public static void changeUserTele(HttpServletRequest request,BigInteger tele) throws Exception{
		User user = UserValidate.getUser(request);
		User user_1 = new User();
		user_1.setUserTele(tele);
		if(user.getUserTele().equals(tele))return;
		Session session = HibernateSessionFactory.getSession();
		User user_2 = (User) session.createCriteria(User.class).add(Example.create(user_1)).uniqueResult();
		if(user_2!=null){
			throw new Exception("手机号已被注册");
		}
		user = (User) session.load(user.getClass(), user.getUserId());
		user.setUserTele(tele);
		Transaction tran = null;
		try{
			tran = session.beginTransaction();
			tran.begin();
			session.update(user);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			throw new Exception("修改失败，请重新输入");
		}finally{
			session.close();
		}
	}
	
	
	
	
	
	public static void userInfoEdit(User new_user ,HttpServletRequest request) throws Exception{
		Session sess = HibernateSessionFactory.getSession();
		User user = UserValidate.getUser(request);
		if(user == null) return ;
		Transaction tran = null;
		try{
			
			user = (User) sess.load(User.class, user.getUserId());
			user.setUserLName(new_user.getUserLName());
			user.setUserFName(new_user.getUserFName());
			user.setUserAddr1(new_user.getUserAddr1());
			user.setUserAddr2(new_user.getUserAddr2());
			user.setUserAddr3(new_user.getUserAddr3());
			tran = sess.beginTransaction();
			tran.begin();
			sess.update(user);
			UserValidate.setUser(request, user);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw new Exception("修改失败");
		}finally{
			sess.close();
		}
	}
	
	
	/**
	 * 根据所有的用户评价中，用户对店铺的评级,以及用户对店铺的新评价，计算新店铺的总评级。
	 * @param storeId 店铺id
	 * @param new_stars 新评价的分数
	 * @param sess hibernate会话
	 * @return 店铺总评分 Integer (1 到 10)
	 * @throws SQLException 
	 */
	static private Integer getNewStoreStars(Integer storeId , Integer new_stars) throws SQLException{
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		Connection conn = sess.connection();
		Statement state = conn.createStatement();
		String sql = "select avg(store_comnt.store_comnt_stars) ,count(*) from store_comnt where store_comnt.store_id = "+storeId
			+ " and store_comnt.store_comnt_stars is not null";
		ResultSet rs = state.executeQuery(sql);
		rs.next();
		Double stars = rs.getDouble(1);
		int num = rs.getInt(2);
		state.close();
		conn.close();
		double new_stars_double = ((stars*num)+new_stars)/(num+1);
		return MyMath.siSeWuru(new_stars_double);
	}
	
	static public void register(User user) throws Exception{
		AdminUser au = new AdminUser();
		au.setUserRegisterTime(new Date());
		au.setUser(user);
		Session session  =  HibernateSessionFactory.getSession();
		Transaction tran = null;
		try{
			tran = session.getTransaction();
			tran.begin();
			BigInteger num = (BigInteger) session.
			createSQLQuery("select count(*) from user as u " +
					"where u.user_tele = :tele or u.user_email = :email")
					.setBigInteger("tele", user.getUserTele()).setString("email", user.getUserEmail()).uniqueResult();
			if(num.intValue()>0) 
				throw new Exception("手机'"+user.getUserTele()+"'或邮箱'"+user.getUserEmail()+"'已经注册过。请重新输入");
			session.save(user);
			au.setUserId(user.getUserId());
			session.save(au);
			tran.commit();
		}catch(Exception e){
			e.printStackTrace();
			tran.rollback();
			throw e;
		}finally{
			if(session.isOpen())session.close();
		}
	}
	
	static public void saveAdvise(ActionForm form) throws Exception{
		AdviseForm aform = (AdviseForm) form;
		Liuyan ad = new Liuyan();
		ad.setLiuyanContent(aform.getAdviseContent());
		ad.setLiuyaner(aform.getAdviseName());
		ad.setLiuyanTime(new Date());
		Session session  =  HibernateSessionFactory.getSession();
		Transaction tran = null;
		try{
			tran = session.getTransaction();
			tran.begin();
			session.save(ad);
			tran.commit();
		}catch(Exception e){
			e.printStackTrace();
			tran.rollback();
			throw e;
		}finally{
			if(session.isOpen())session.close();
		}
	}
	
	static public boolean canRegisterEmail(String email){
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		BigInteger num = (BigInteger) sess.createSQLQuery("select count(*) from user where user.user_email = :email").setString("email", email).uniqueResult();
		if(num.intValue() == 0 ) return true;
		return false;
	}
	
	static public boolean canRegisterPhone(String phone){
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		BigInteger num = (BigInteger) sess.createSQLQuery("select count(*) from user where user.user_tele = :phone").setString("phone", phone).uniqueResult();
		if(num.intValue() == 0 ) return true;
		return false;
	}
	
	static public void saveApply(ActionForm form) throws Exception{
		ApplyForm appf = (ApplyForm) form;
		StoreApply apply = new StoreApply();
		apply.setAppMessage(appf.getMessage());
		apply.setAppName(appf.getName());
		apply.setAppStoreName(appf.getStoreName());
		apply.setAppState(new Long(StoreApply.STATE_UN_READED));
		apply.setAppStoreAddr(appf.getAddress());
		apply.setAppTele(appf.getTelephone());
		apply.setAppTime(new Date());
		Session sess = HibernateSessionFactory.getSession();
		Transaction tran = null;
		try{
			tran = sess.beginTransaction();
			tran.begin();
			sess.save(apply);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			throw e;
		}finally{
			if(sess.isOpen())sess.close();
		}
	}
}
