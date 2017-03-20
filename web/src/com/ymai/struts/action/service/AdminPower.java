package com.ymai.struts.action.service;

import java.util.Iterator;

import com.ymai.hibernate.Admin;
import com.ymai.hibernate.Role;

public class AdminPower {
	
	static final public int ALL = 1;
	static final public int ORDER = 2;
	static final public int JIFEN = 3;
	static final public int STORE_ACC = 4;
	static final public int STORE_EDIT = 5;

	
	public static boolean power(Admin admin , int power){
		if(admin == null) return false;
		Iterator iter = admin.getRoles().iterator();
		while(iter.hasNext()){
			Role role = (Role) iter.next();
			if(role.getRoleId().equals(ALL))return true;
			if(role.getRoleId().equals(power))return true;
		}
		return false;
	}
	
}
 