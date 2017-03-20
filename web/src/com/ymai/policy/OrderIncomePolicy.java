package com.ymai.policy;

import com.ymai.hibernate.Order;

public class OrderIncomePolicy {
	static final public double INCOME_RATE = 0.5;
	static final public double INCOME_UP_LIMIT = 10;
	static final public double INCOME_DOWN_LIMIT = 0.5;
	static final public double ORDER_NOT_PASS_REFUND_TIME = 3600000;
	
	/**扣费政策*/
	static public double orderIncome(Order order){
		Double income = order.getOrderTotalPrice() * 0.05;
		if(income>15)income = 15.0;
		if(income<0.5)income = 0.5;
		return income;
	}

}
