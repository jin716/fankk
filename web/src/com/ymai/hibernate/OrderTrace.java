package com.ymai.hibernate;

import java.util.Date;

/**
 * OrderTrace entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class OrderTrace implements java.io.Serializable {

	// Fields

	private Integer orderTraceId;
	private Order order;
	private Integer orderState;
	private String detail;
	private Date time;
	private String operator;

	// Constructors

	/** default constructor */
	public OrderTrace() {
	}

	/** minimal constructor */
	public OrderTrace(Order orderTb, Integer orderState) {
		this.order = orderTb;
		this.orderState = orderState;
	}

	/** full constructor */
	public OrderTrace(Order orderTb, Integer orderState, String detail,
			Date time) {
		this.order = orderTb;
		this.orderState = orderState;
		this.detail = detail;
		this.time = time;
	}

	// Property accessors

	public Integer getOrderTraceId() {
		return this.orderTraceId;
	}

	public void setOrderTraceId(Integer orderTraceId) {
		this.orderTraceId = orderTraceId;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order orderTb) {
		this.order = orderTb;
	}

	public Integer getOrderState() {
		return this.orderState;
	}

	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	public String getOperator() {
		return this.operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}


	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

}