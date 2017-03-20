package com.ymai.policy;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ymai.hibernate.HibernateSessionFactory;
import com.ymai.hibernate.Order;
import com.ymai.hibernate.Store;
import com.ymai.hibernate.User;

public class UserJifenPolicy {
	
	final static public Integer AM_BUZY_START = 11;
	final static public Integer AM_BUZY_END = 13;
	final static public Integer PM_BUZY_START = 16;
	final static public Integer PM_BUZY_END = 19;
	final static public Double  UN_BUZY_TIME_JIFEN = 1.5;

	static private boolean isBusyTime(Date time){
		Integer hour = time.getHours();
		if((hour >= AM_BUZY_START && hour <= AM_BUZY_END)
				||(hour >= PM_BUZY_START && hour <= PM_BUZY_END)){
			return true;
		}
		return false;
	}
	
	static public Double getJifen(Store store,Date time){
		if(isBusyTime(time)){
			return store.getStoreJifen();
		}else {
			return store.getStoreJifen()*UN_BUZY_TIME_JIFEN;
		}
	}
	
	static public Integer InitialOrderJifen(Order order){
		Integer base_jifen = order.getOrderTotalPrice().intValue();
		Integer store_jifen = ((Double)(base_jifen * order.getStore().getStoreJifen())).intValue();
		if(isBusyTime(order.getOrderTime())){
			return store_jifen;
		}
		else {
			return ((Double)(store_jifen*UN_BUZY_TIME_JIFEN)).intValue();
		}
	}
	
	static public Integer getPingjiaJifen(){
		return 2;
	}
	
	static public Integer getOrderJifen(Integer oid){
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		Integer jf = (Integer) session.createSQLQuery("select order_jifen from order_tb where order_id = :oid")
		.setInteger("oid", oid).uniqueResult();
		return jf;
	}

	static public boolean upDateUser(User user , Integer jifen , boolean add) throws JifenNotEnoughException{
		Session session = HibernateSessionFactory.getSession();
		User u = (User) session.get(User.class, user.getUserId());
		Integer jf = u.getUserJifen();
		if( jf == null ) jf = 0;
		if(add) jf += jifen;
		else jf -= jifen;
		u.setUserJifen(jf);
		if(jf <0 ) throw new JifenNotEnoughException();
		Transaction tran = null;
		try{
			tran = session.beginTransaction();
			session.update(u);
			tran.commit();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			tran.rollback();
			return false;
		}finally{
			if(session.isOpen())session.close();
		}
		
	}
}
