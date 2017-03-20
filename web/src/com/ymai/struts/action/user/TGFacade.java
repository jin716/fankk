package com.ymai.struts.action.user;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ymai.hibernate.HibernateSessionFactory;
import com.ymai.hibernate.TgUser;
import com.ymai.hibernate.TgUserAndUser;
import com.ymai.hibernate.TgUserAndUserId;
import com.ymai.hibernate.User;

public class TGFacade {
	
	static public void addUser(String key , User user){
		if(key == null || user == null ) return ;
		Session session = HibernateSessionFactory.getSession();
		TgUser tgUser = null;
		try{
		tgUser = (TgUser) session.createSQLQuery("select * from tg_user where u_key = :key")
		.addEntity(TgUser.class).setString("key", key).uniqueResult();
		}catch(Exception e){
			e.printStackTrace();
		}
		if(tgUser == null) return ;
		TgUserAndUser tguu = new TgUserAndUser();
		TgUserAndUserId id = new TgUserAndUserId();
		id.setUser(user);
		id.setTgUser(tgUser);
		tguu.setId(id);
		tguu.setTime(new Date());
		Transaction tran = null;
		try{
			tran = session.beginTransaction();
			tran.begin();
			session.save(tguu);
			tran.commit();
			session.close();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
		}
		
	}
	
}
