package com.ymai.struts.action;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ymai.hibernate.HibernateSessionFactory;
import com.ymai.hibernate.SearchCount;

public class SearchThread extends Thread{
	
	private String key = null;
	private Integer type = null;
	public SearchThread(String key,Integer type){
		this.key = key;
		this.type =type;
	}
	
	public void run(){
	try{
		Session session = HibernateSessionFactory.getSession();
		SearchCount sc = (SearchCount) session.get(SearchCount.class, this.key);
		if(sc == null){
			sc = new SearchCount();
			sc.setKey(this.key);
			sc.setType(this.type);
			sc.setCounter(new Long(0));
		}
		sc.setCounter(sc.getCounter()+1);
		Transaction tran = null;
		try{
			tran = session.beginTransaction();
			tran.begin();
			session.saveOrUpdate(sc);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
		}
		finally{
			if(session.isOpen())session.close();
		}
		}catch(Exception e){
			e.printStackTrace();

	}
	}

}
