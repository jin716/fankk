package com.ymai.struts.action.order;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ymai.hibernate.HibernateSessionFactory;
import com.ymai.hibernate.Item;
import com.ymai.hibernate.Order;
import com.ymai.hibernate.OrderItems;
import com.ymai.hibernate.OrderTrace;
import com.ymai.hibernate.Store;
import com.ymai.hibernate.User;
import com.ymai.policy.OrderIncomePolicy;
import com.ymai.policy.UserJifenPolicy;
import com.ymai.sms.SMSSendError;
import com.ymai.sms.SMSSender;
import com.ymai.sms.SMSSenderFactory;
import com.ymai.struts.action.user.UserValidate;

public class OrderLife {
	
	static public final String current_order = "c_order";
	public static final String USER_ORDER_ID = "u_order_id";

	static public Integer getCurrentOrderId(HttpServletRequest request){
		try{
			return (Integer) request.getSession().getAttribute(USER_ORDER_ID);
		}catch(Exception e){
			return null;
		}
	}
	
	static private Order getOrderFromSession(HttpServletRequest request){
		try{
			return (Order) request.getSession().getAttribute(current_order);
		}catch(Exception e){
			return null;
		}
	}

	
	
	
	/**step 1 不入数据库*/
	public static Order setOrderToSession(AddOrderForm aform, HttpServletRequest request){
		Order order = new Order();
		Session sess = HibernateSessionFactory.getSession();
		Store store = (Store) sess.load(Store.class, aform.getStoreId());
		Integer onum = (Integer) sess.createSQLQuery("select max(order_num) from order_tb where store_id = :store")
		.setInteger("store", store.getStoreId()).uniqueResult();
		if(onum == null)onum = 1 ;
		else onum =onum+ 1;
		order.setOrderNum(onum.intValue());
		//设置订单所属的商家
		order.setStore(store);
		//订单日期
		order.setOrderTime(new Date());
		//订单电话
		order.setOrderTele(aform.getTele());
		//订单地址
		order.setOrderAddr(aform.getAddress());
		//订单状态
		order.setOrderState(Order.STATE_UN_READ);
		
		//订单货物ID数组
		Integer[] itemIds = aform.getItemIds();
		//用户
		User user = UserValidate.getUser(request);
		order.setUser(user);
		order.setName(aform.getName());
		order.setOrderRemark(aform.getOthers());
		//订单总价
		Double all_totals = 0.0;
		Set orderItemses = new HashSet(0);
		//将物品，物品数量，单个物品总价添加到订单中去
		for(int i = 0 ; i < aform.getItemIds().length ; ++ i ){
			//前台某物品订单数目的命名规则，如物品ID为 15 , 则命名为： 15_num;
			Integer itemId = itemIds[i];
			String num_name = itemId+"_num";
			Integer num  = Integer.valueOf(request.getParameter(num_name));
			OrderItems oi = new OrderItems();
			Item item = (Item) sess.get(Item.class, itemId);
			oi.setItem(item);
			oi.setItemNum(num);
			oi.setItemTotalPrice(item.getItemPrice()*num);
			all_totals += oi.getItemTotalPrice();
			oi.setOrder(order);
			oi.setItemName(item.getItemName());
			orderItemses.add(oi);
		}
		//本次订单总价
		order.setOrderTotalPrice(all_totals+store.getStoreSendCost());
		order.setOrderSendPrice(store.getStoreSendCost());
		order.setOrderItemses(orderItemses);
		//积分计算
		order.setUserJifen(UserJifenPolicy.InitialOrderJifen(order));
		sess.close();
		request.getSession().setAttribute(current_order, order);
		return order;
	}
	
	/**step 2 入数据库并开始跟踪*/
	public static void setOrderToAudit(HttpServletRequest request) throws Exception{
		Order order = getOrderFromSession(request);
		OrderTrace ot = new OrderTrace();
		Session sess = HibernateSessionFactory.getSession();
		//存入数据库
		User user = order.getUser();
		Store store = order.getStore();
		store.payForOrder(order);
		if(user!=null) user = (User) sess.get(User.class, user.getUserId());
		Transaction tran = null;
		try{
			tran = sess.beginTransaction();
			tran.begin();
			order.setUser(user);
			Integer id =  (Integer) sess.save(order);
			ot.setOrder(order);
			ot.setOrderState(order.getOrderState());
			ot.setTime(new Date());
			sess.save(order);
			sess.update(store);
			sess.save(ot);
			request.getSession().setAttribute("u_order_id", id);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw new Exception("订单添加失败");
			
		}finally{
			if(sess.isOpen())sess.close();
		}
	}
	
	/**读取订单**/
	public static Order readOrder(Integer orderId){
		Session sess = HibernateSessionFactory.getSession();
		Order order = (Order) sess.get(Order.class, orderId);
		OrderTrace ot = new OrderTrace();
		if(order!=null){
			Transaction tran = null;
			try{
				tran = sess.beginTransaction();
				tran.begin();
				order.setOrderState(Order.STATE_AUDITING);
				ot.setOrder(order);
				ot.setOrderState(order.getOrderState());
				ot.setTime(new Date());
				sess.save(ot);
				sess.update(order);
				tran.commit();
			}catch(Exception e){
				
			}
			if(sess.isOpen())sess.close();
		}
		return order;
	}
	

	
	/**step 3 审核*/
	static public void audit(Integer orderId , boolean result , String message){
		Session sess = HibernateSessionFactory.getSession();
		Transaction tran = null;
		try{
			tran = sess.beginTransaction();
			tran.begin();
			Order order = (Order) sess.get(Order.class, orderId);
			if(!result)order.setOrderState(Order.STATE_NOT_PASS);
			else order.setOrderState(Order.STATE_OK);
			order.setOrderAudit(message.trim());
			OrderTrace ot = new OrderTrace();
			ot.setOrder(order);
			ot.setOrderState(order.getOrderState());
			ot.setTime(new Date());
			sess.save(ot);
			sess.update(order);
			tran.commit();
		}catch(Exception e){
			
		}finally{
			if(sess.isOpen())sess.close();
		}
	}
	
	/**订单完成*/
	static public void orderOk(Integer orderId){
		Session sess = HibernateSessionFactory.getSession();
		Transaction tran = null;
		try{
			tran = sess.beginTransaction();
			tran.begin();
			Order order = (Order) sess.get(Order.class, orderId);
			User user = order.getUser();
			///积分
			if(user != null) {
				Integer jf = user.getUserJifen();
				if( jf == null ) jf = 0;
				jf += order.getUserJifen();
				user.setUserJifen(jf);
			}
			order.setOrderState(Order.STATE_OK);
			OrderTrace ot = new OrderTrace();
			ot.setOrder(order);
			ot.setOrderState(order.getOrderState());
			ot.setTime(new Date());
			sess.save(ot);
			sess.update(order);
			if(user != null)sess.update(user);
			tran.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(sess.isOpen())sess.close();
		}
	}
	
	
	
}
