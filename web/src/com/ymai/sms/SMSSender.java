package com.ymai.sms;

import com.ymai.hibernate.Order;

public interface SMSSender {
	
	public String sendOrder(Order order,String tele)throws SMSSendError;
	
	public String orderRemind(Integer orderNum,String tele)throws SMSSendError;
	
	public String sendActiveCode(String code , String tele)throws SMSSendError;
	
	public String sendMessage(String message , String tele)throws SMSSendError;

}
