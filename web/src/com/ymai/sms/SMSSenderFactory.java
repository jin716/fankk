package com.ymai.sms;

import com.ymai.sms.dxtSender.DXTSender;

public class SMSSenderFactory {
	static final public int SENDER_TYPE_DEBUG = 0;
	static final public int SENDER_TYPE_35DXT = 1;
	static final public int CURRENT_SENDER = 	1;

	static final public String host = "222.73.36.203";
	static final public int    port = 0;
	static final public String user = "80000091";
	static final public String pass = "fkk15622218096";
	static final public int INTERVAL = 30000;

	
	
	private SMSSenderFactory() {}
	
	static public SMSSender getInstance() {
		switch(CURRENT_SENDER){
			case SENDER_TYPE_35DXT:return new DXTSender();
			case SENDER_TYPE_DEBUG:return new SMSDebugSender();
		}
		return null;
	}
}
