package com.ymai.struts.action;

import java.io.Serializable;

import org.hibernate.Session;

import com.ymai.hibernate.HibernateSessionFactory;

public class ActionFacade {
	
	static public Session session(){
		return HibernateSessionFactory.getSessionFactory().getCurrentSession();
	}
	
	static public Session newSession(){
		return HibernateSessionFactory.getSession();
	}
	
	static public Object load(Class c,Serializable id){
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		return session.load(c,  id);
	}
	
	static public Object get(Class c,Serializable id){
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		return session.get(c,  id);
	}

}
