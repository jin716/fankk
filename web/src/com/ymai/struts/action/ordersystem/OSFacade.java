package com.ymai.struts.action.ordersystem;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.net.Socket;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ymai.hibernate.HibernateSessionFactory;
import com.ymai.hibernate.Order;
import com.ymai.hibernate.OrderTrace;
import com.ymai.hibernate.Store;
import com.ymai.hibernate.User;
import com.ymai.policy.OrderIncomePolicy;
import com.ymai.struts.Page;
import com.ymai.struts.action.user.UserValidate;

public class OSFacade {
	
	static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	

	
	public static Integer getNewOrderNum(HttpServletRequest request){
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		Store store = UserValidate.getStore(request);
		if(store == null)return -1;
		BigInteger num = (BigInteger) sess.createSQLQuery("select count(*) from order_tb where store_id = :store and order_state = 0")
		.setInteger("store", store.getStoreId()).uniqueResult();
		return num.intValue();
	}
	
	public static Page getOrderPage(HttpServletRequest request , Integer pageNo ,Integer eachPage){
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		Store store = UserValidate.getStore(request);
		BigInteger total = (BigInteger) sess.createSQLQuery("select count(*) from order_tb where store_id = :store")
		.setInteger("store", store.getStoreId()).uniqueResult();
		Page page = new Page(pageNo,total.intValue(),eachPage);
		List list = sess.createSQLQuery("select * from order_tb where store_id = :store order by order_id desc")
		.addEntity(Order.class).setInteger("store", store.getStoreId())
		.setMaxResults(page.getEachPage()).setFirstResult(page.getStart()).list();
		page.setList(list);
		return page;
	}
	
	public static Order getOrderDetail(HttpServletRequest request , Integer orderId){
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		Store store = UserValidate.getStore(request);
		Order order = (Order) sess.createSQLQuery("select * from order_tb where store_id = :store and order_id = :order")
		.addEntity(Order.class).setInteger("order", orderId).setInteger("store", store.getStoreId()).uniqueResult();
		return order;
	}
	

	
	
	public static void orderAudit(Integer orderId , Integer state , String detail ,String operator) throws Exception{
		Session sess = HibernateSessionFactory.getSession();
		OrderTrace ot = new OrderTrace();
		Order order = (Order) sess.createSQLQuery("select * from order_tb where order_id = :order")
		.addEntity(Order.class).setInteger("order", orderId).uniqueResult();
		if(order!=null){
			if(state.equals(Order.STATE_AUDITING)){
				if(!(order.getOrderState().equals(Order.STATE_UN_READ)||
						order.getOrderState().equals(Order.STATE_AUDITING))){
					if(sess.isOpen())sess.close();
					return ;
				}
			}
			User user = order.getUser();
			Transaction tran = null;
			try{
				tran = sess.beginTransaction();
				tran.begin();
				//退款
				if(state.equals(Order.STATE_NOT_PASS)){
					if(!(order.getOrderState().equals(Order.STATE_NOT_PASS))){
						long time = order.getOrderTime().getTime();
						long now_t = new Date().getTime();
						if(now_t - time < OrderIncomePolicy.ORDER_NOT_PASS_REFUND_TIME){
							Store store = order.getStore();
							store.notPayForOrder(order);
							sess.update(store);
						}
					}
				}
				
				order.setOrderState(state);
				order.setOrderAudit(detail);
				ot.setOrder(order);
				ot.setOrderState(order.getOrderState());
				ot.setTime(new Date());
				ot.setDetail(detail);
				ot.setOperator(operator);
				sess.save(ot);
				sess.update(order);
				tran.commit();
			}catch(Exception e){
				e.printStackTrace();
				tran.rollback();
				throw e;
			}finally{
				if(sess.isOpen())sess.close();
			}
		}
		if(sess.isOpen())sess.close();
	}
	
	private static String orderTimeKey(Integer orderId){
		return "order_time_"+orderId;
	}
	private static String orderUserKey(Integer orderId){
		return "order_user_"+orderId;
	}
	
	/* *
	 * TO-DO 
	 * 
	 * */
	static public final long order_off_line_interval = 2000;
	public static boolean processingOrder(Integer orderId,String id){
		try {
			String ot_key = orderTimeKey(orderId);
			String ou_key = orderUserKey(orderId);
			MemCached cache = MemCached.getInstance();
			String l_string = (String) cache.get(ot_key);
			if(l_string == null){
				cache.add(ot_key, format.format(new Date()));
				cache.add(ou_key, id);
				return true;
			}
			else {
				Date last = format.parse(l_string);
				Date now_d = new Date();
				if(now_d.getTime() - last.getTime() > order_off_line_interval) {
					cache.add(ot_key, format.format(new Date()));
					cache.add(ou_key, id);
					return true;
				}
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
	}
	public static void lockOrder(Integer orderId,String id){
		try{
			String ot_key = orderTimeKey(orderId);
			String ou_key = orderUserKey(orderId);
			MemCached cache = MemCached.getInstance();
			Date last = format.parse((String) cache.get(ot_key));
			if(last == null){
				cache.add(ot_key, format.format(new Date()));
				cache.add(ou_key, id);
				return;
			}
			else{
				cache.replace(ot_key, format.format(new Date()));
				cache.replace(ou_key, id);
				return;
			}
		}catch(Exception e){
			
		}
	}
	static public String orderProcesser(Integer orderId){
		MemCached cache = MemCached.getInstance();
		return (String) cache.get(orderUserKey(orderId));
	}
	
	static public Date getOrderTraceTime(Integer orderId , Integer state){
		Session session =  HibernateSessionFactory.getSessionFactory().getCurrentSession();
		List list =  session.createSQLQuery("select * from order_trace where order_id = :orderId" +
				" and order_state = :state order by time desc").addEntity(OrderTrace.class)
		.setInteger("orderId", orderId).setInteger("state", state).list();
		OrderTrace ot = null;
		if(list != null && list.size() > 0 ) ot = (OrderTrace) list.get(0);
		if(ot!=null)return ot.getTime();
		return null;
	}

	public static void main(String[] args) throws UnknownHostException, IOException, InterruptedException{
		MemCached cache = MemCached.getInstance();
		System.out.println(cache.get("1"));

	}
}
