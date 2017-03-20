package com.ymai.struts.action.user;

import java.math.BigInteger;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nl.captcha.Captcha;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Expression;

import com.ymai.hibernate.HibernateSessionFactory;
import com.ymai.hibernate.Order;
import com.ymai.hibernate.Store;
import com.ymai.hibernate.User;
import com.ymai.struts.CookieUtil;
import com.ymai.struts.action.ordersystem.OSFacade;

public class UserValidate {
	
	static public final String current_user = "c_user";
	static public final String current_store = "c_store";
	static public final String current_tele = "c_tele";
	static public final String current_order = "c_order";
	static public final String unActive_user = "u_user";
	
	static public User login(HttpServletRequest request,String name , String password){
		//Session session = HibernateSessionFactory.getSession();
		request.getSession().invalidate();//清空session
		Cookie cookie = request.getCookies()[0];//获取cookie
		cookie.setMaxAge(0);//让cookie过期
		
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		BigInteger tele = null;
		try{
			tele = BigInteger.valueOf(Long.valueOf(name));
		}catch(NumberFormatException e){
			
		}
		String sql = "select * from user as u where " +
				"(u.user_tele = :tele or u.user_email =:email)" +
				"and u.user_password = :pass";
		User user = (User) session.createSQLQuery(sql).addEntity(User.class)
		.setParameter("tele", name).setParameter("email", name).setParameter("pass", password).uniqueResult();
		return user;
	}
	
	
	/**用于前台cookie登录，如果成功则将用户设进会话中，否则不设，不抛出异常*/
	static public void loginOK(HttpServletRequest request,HttpServletResponse response){
		try{
			if(UserValidate.getUser(request)==null){
				String name = CookieUtil.getUserInCookies(request);
				String pass = CookieUtil.getPasswordInCookies(request);
				BigInteger tele = null;
				if(name!=null&&name.trim().length()>0&&pass!=null&&pass.trim().length()>0){
					Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
					try{
						tele = BigInteger.valueOf(Long.valueOf(name));
					}catch(NumberFormatException e){
						
					}
					String sql = "select * from user as u where " +
							"(u.user_tele = :tele or u.user_email =:email)" +
							"and u.user_password = :pass";
					User user = (User) session.createSQLQuery(sql).addEntity(User.class)
					.setParameter("tele", name).setParameter("email", name).setParameter("pass", pass).uniqueResult();
					if(user!=null&&user.getUserState().equals(User.STATE_ACTIVE)){
						UserValidate.setUser(request, user);
						if(user.getUserIsStore()){
							UserValidate.setStore(request, user);
						}
						return;
					}
					else{
						CookieUtil.removeUserInCookies(request, response);
					}
					
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	static public boolean canEditItem(HttpServletRequest request, Integer itemId){
		Store store = getStore(request);
		if(store == null) return false;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		BigInteger num = (BigInteger) session.createSQLQuery("select count(*) from item as i " +
				"where i.store_id = :store and i.item_id = :item")
				.setInteger("store", store.getStoreId()).setInteger("item", itemId)
				.uniqueResult();
		if(num.intValue()>0) return true;
		return false;	
	}
	
	static public String getValidateCodeValue(HttpServletRequest request){
		Captcha captcha = (Captcha) request.getSession().getAttribute("simpleCaptcha");
		if(captcha!=null)return captcha.getAnswer();
		return null;
	}
	
	static public User getUser(HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(current_user);
		if(user == null)return null;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		user = (User) session.load(User.class, user.getUserId());
		return user;
	}
	
	static public void reFreshUser(HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(current_user);
		if(user == null)return;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		user = (User) session.get(User.class, user.getUserId());
		request.getSession().setAttribute(current_user, user);
	}
	
	static public BigInteger getTele(HttpServletRequest request){
		BigInteger tele = (BigInteger) request.getSession().getAttribute(current_tele);
		return tele;
	}
	
	static public void setTele(HttpServletRequest request,BigInteger tele){
		request.getSession().setAttribute(current_tele,tele);
	}
	
	static public Order getOrder(HttpServletRequest request){
		Order order = (Order) request.getSession().getAttribute(current_order);
		return order;
	}
	

	
	static public void setOrder(HttpServletRequest request,Order order){
		request.getSession().setAttribute(current_order,order);
	}
	
	static public Store getStore(HttpServletRequest request){
		Store store = (Store) request.getSession().getAttribute(current_store);
		if(store == null) {
			try{
				User user = getUser(request);
				store = (Store) user.getStores().iterator().next();
			}catch(Exception e){
				return null;
			}
		}
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		store = (Store) session.load(Store.class, store.getStoreId());
		return store;
	}

	static public boolean isLogin(HttpServletRequest request){
		if(getUser(request)!=null)return true;
		return false;
	}
	
	static public void setUser(HttpServletRequest request, User user){
		request.getSession().setAttribute(current_user, user);
	}
	
	static public void setUnactiveUser(HttpServletRequest request, User user){
		request.getSession().setAttribute(unActive_user, user);
	}
	
	static public User getUnactiveUser(HttpServletRequest request){
		return (User) request.getSession().getAttribute(unActive_user);
	}
	
	
	static public void setStore(HttpServletRequest request, User user){
		Store store = null;
		try{
			store = (Store) user.getStores().iterator().next();
		}catch(Exception e){
			
		}
		request.getSession().setAttribute(current_store, store);
	}
	
	static public void quite(HttpServletRequest request,HttpServletResponse response){
		request.getSession().removeAttribute(current_user);
		request.getSession().removeAttribute(current_store);
		CookieUtil.removeUserInCookies(request, response);
	}
	
	public static boolean canEditStore(HttpServletRequest request, Integer storeId){
		Store store = getStore(request);
		if(store == null )return false;
		if(store.getStoreId() == storeId)return true;
		return false;
	}

	static public void main(String[] args){
		Session session = HibernateSessionFactory.getSession();
		String name = "jin";
		String password = "1234";
		BigInteger tele = null;
		try{
			tele = BigInteger.valueOf(Long.valueOf(name));
		}catch(NumberFormatException e){
			
		}
		String sql = "select * from user as u where " +
				"(u.user_login_name = :name or u.user_tele = :tele or u.user_email =:email)" +
				"and u.user_password = :pass";
		User user = (User) session.createSQLQuery(sql).addEntity(User.class).setParameter("name", name)
		.setParameter("tele", name).setParameter("email", name).setParameter("pass", password).uniqueResult();
		System.out.print(user.getUserLoginName());
	}
}
