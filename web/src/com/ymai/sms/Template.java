package com.ymai.sms;

import java.util.Iterator;

import com.ymai.hibernate.Order;
import com.ymai.hibernate.OrderItems;

public class Template {
	static final String FANKK = "(饭快快:fankk.com)";
	static public String toString(Order order){
		StringBuffer sb = new StringBuffer(order.getName()+"("+order.getOrderTele()+"）的订单:");
		Iterator iter = order.getOrderItemses().iterator();
		OrderItems oi = null;
		while(iter.hasNext()){
			oi = (OrderItems) iter.next();
			sb.append(oi.getItemName()+" "+oi.getItemNum()+"份，");
		}
		sb.append("送到："+order.getOrderAddr()+"。");
		String remark = order.getOrderRemark();
		if(remark!=null||remark.trim().length()>0){
			sb.append("备注："+remark+"。");
		}
		sb.append(FANKK);
		return sb.toString();
	}
	
	static public String toString(Integer order_num){
		String str = "您有新订单"+order_num+"份，请查收。"+FANKK;
		return str.toString();
	}
	
	static public String toString(String vcode){
		return "尊敬的用户您好，您的验证码为："+vcode+",感谢您的使用！"+FANKK;
		
	}
}
