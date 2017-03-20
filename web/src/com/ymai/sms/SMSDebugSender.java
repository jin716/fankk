package com.ymai.sms;

import com.uniproud.sms.SMSClient;
import com.uniproud.sms.ToServerXML;
import com.ymai.hibernate.Order;

public class SMSDebugSender implements SMSSender{
	

	public String orderRemind(Integer order_num, String tele) throws SMSSendError {
		String message = Template.toString(order_num);
	    System.out.println(message);                   
	    return null;
	}

	public String sendActiveCode(String vcode, String tele) throws SMSSendError {
		String message = Template.toString(vcode);
		System.out.println(message);                   
	    return null;
	}

	public String sendOrder(Order order, String tele) throws SMSSendError {
		String message = Template.toString(order);
		System.out.println(message);                   
	    return null;
	}

	public String sendMessage(String message, String tele) throws SMSSendError {
		System.out.println(message);                   
	    return null;
	}

}
