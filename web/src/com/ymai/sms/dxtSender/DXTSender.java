package com.ymai.sms.dxtSender;

import com.uniproud.sms.SMSClient;
import com.uniproud.sms.ToServerXML;
import com.ymai.hibernate.Order;
import com.ymai.sms.SMSSendError;
import com.ymai.sms.SMSSender;
import com.ymai.sms.SMSSenderFactory;
import com.ymai.sms.Template;

public class DXTSender implements SMSSender{
	
	SMSClient client = null;
	
	public DXTSender(){
		 this.client = new SMSClient(SMSSenderFactory.host);//一般情况下
	}

	public String orderRemind(Integer order_num, String tele) throws SMSSendError {
		String message = Template.toString(order_num);
	    String reciveMes = client.SendReceive(ToServerXML.getSendSmsXML(
	    		SMSSenderFactory.user, 
	    		SMSSenderFactory.pass,
	    		tele, 
	    		message)
	    		,"urn:SendSmsToServer");                   
	    return reciveMes;
	}

	public String sendActiveCode(String vcode, String tele) throws SMSSendError {
		String message = Template.toString(vcode);
	    String reciveMes = client.SendReceive(ToServerXML.getSendSmsXML(
	    		SMSSenderFactory.user, 
	    		SMSSenderFactory.pass,
	    		tele, 
	    		message)
	    		,"urn:SendSmsToServer");                   
	    return reciveMes;
	}

	public String sendOrder(Order order, String tele) throws SMSSendError {
		String message = Template.toString(order);
	    String reciveMes = client.SendReceive(ToServerXML.getSendSmsXML(
	    		SMSSenderFactory.user, 
	    		SMSSenderFactory.pass,
	    		tele, 
	    		message)
	    		,"urn:SendSmsToServer");                   
	    return reciveMes;
	}

	public String sendMessage(String message, String tele) throws SMSSendError {
		 String reciveMes = client.SendReceive(ToServerXML.getSendSmsXML(
		    		SMSSenderFactory.user, 
		    		SMSSenderFactory.pass,
		    		tele, 
		    		message)
		    		,"urn:SendSmsToServer");                   
		 return reciveMes;
	}

}
