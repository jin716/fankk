package com.ymai.struts.action.service;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.ymai.hibernate.Admin;
import com.ymai.hibernate.HibernateSessionFactory;
import com.ymai.hibernate.Order;
import com.ymai.hibernate.Store;
import com.ymai.struts.Page;
import com.ymai.struts.action.ordersystem.MemCached;
import com.ymai.struts.action.user.UserValidate;

public class ServiceFacade {
	
	public static Object get(Class arg0 , Serializable arg1){
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		return session.get(arg0, arg1);
	}
	
	public static Object load(Class arg0 , Serializable arg1){
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		return session.load(arg0, arg1);
	}
	
	public static Admin login(String name, String pass){
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		Admin admin = (Admin) session.get(Admin.class, name);
		if(admin!=null && admin.getPassword().equals(pass))return admin;
		return null;
	}
	
	
	public static Page getLatestOrder(int pageNum , int eachPage){
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		int size  = session.createCriteria(Order.class).list().size();
		Page page = new Page(pageNum,size,eachPage);
		List list = session.createSQLQuery("select * from order_tb order by order_time desc limit :offset, :length")
		.addEntity(Order.class).setInteger("offset", page.getStart()).setInteger("length", page.getEachPage()).list();
		page.setList(list);
		return page;
	}

	public static Page getOrder(String start , String end , int pageNum , int eachPage){
		if(start == null || end == null)
			return null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date start_d = null;
		Date end_d = null;
		try {
			start_d = sdf.parse(start);
			end_d =  sdf.parse(end);
			end_d.setDate(end_d.getDate()+1);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		int size  = session.createCriteria(Order.class).
		add(Restrictions.between("orderTime", start_d, end_d)).list().size();
		Page page = new Page(pageNum,size,eachPage);
		List list = session.createCriteria(Order.class).
		addOrder(org.hibernate.criterion.Order.desc("orderTime")).
		add(Restrictions.between("orderTime", start_d, end_d)).
		setFirstResult(page.getStart()).setMaxResults(page.getEachPage())
		.list();
		page.setList(list);
		return page;
	}
	
	
}
