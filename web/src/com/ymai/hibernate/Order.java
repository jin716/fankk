package com.ymai.hibernate;

import java.math.BigInteger;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Order entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Order implements java.io.Serializable {

	// Fields
	final static public int STATE_UN_READ = -1;
	final static public int STATE_NOT_PASS = 0;
	final static public int STATE_AUDITING = 1;
	final static public int STATE_TELLED_STORE = 2;
	final static public int STATE_OK = 3;
	
	public String getOrderStateString(){
		if(this.orderState.equals(Order.STATE_UN_READ))return "待处理";
		if(this.orderState.equals(Order.STATE_AUDITING))return "处理中";
		if(this.orderState.equals(Order.STATE_NOT_PASS))return "订单失败";
		if(this.orderState.equals(Order.STATE_TELLED_STORE))return "店家处理中";
		if(this.orderState.equals(Order.STATE_OK))return "完成";
		return null;
	}
	
	private Integer orderId;
	private User user;
	private String name;
	private Store store;
	private Date orderTime;
	private BigInteger orderTele;
	private String orderAddr;
	private Double orderTotalPrice;
	private Set orderItemses = new HashSet(0);
	private Integer orderState;
	private String orderRemark;
	private Double orderSendPrice;
	private Integer orderNum;
	private String orderAudit;
	private Integer userJifen;
	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(User user, Store store, Date orderTime, BigInteger orderTele,
			String orderAddr, Double orderTotalPrice) {
		this.user = user;
		this.store = store;
		this.orderTime = orderTime;
		this.orderTele = orderTele;
		this.orderAddr = orderAddr;
		this.orderTotalPrice = orderTotalPrice;
	}

	/** full constructor */
	public Order(User user, Store store, Date orderTime, BigInteger orderTele,
			String orderAddr, Double orderTotalPrice, Set orderItemses) {
		this.user = user;
		this.store = store;
		this.orderTime = orderTime;
		this.orderTele = orderTele;
		this.orderAddr = orderAddr;
		this.orderTotalPrice = orderTotalPrice;
		this.orderItemses = orderItemses;
	}

	// Property accessors

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	
	public Integer getOrderNum() {
		return this.orderNum;
	}

	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Store getStore() {
		return this.store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public Date getOrderTime() {
		return this.orderTime;
	}
	
	public String getOrderTimeString() {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		if(this.orderTime == null )return null;
		return df.format(this.orderTime);
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	
	public Integer getOrderState(){
		return this.orderState;
	}
	
	public void setOrderState(Integer orderstate){
		this.orderState = orderstate;
	}
	

	public BigInteger getOrderTele() {
		return this.orderTele;
	}

	public void setOrderTele(BigInteger orderTele) {
		this.orderTele = orderTele;
	}
	

	public String getOrderRemark() {
		return this.orderRemark;
	}

	public void setOrderRemark(String orderRemark) {
		this.orderRemark = orderRemark;
	}
	
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOrderAddr() {
		return this.orderAddr;
	}

	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}

	public Double getOrderTotalPrice() {
		return this.orderTotalPrice;
	}

	public void setOrderTotalPrice(Double orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	public Set getOrderItemses() {
		return this.orderItemses;
	}

	public void setOrderItemses(Set orderItemses) {
		this.orderItemses = orderItemses;
	}
	
	public Double getOrderSendPrice(){
		return this.orderSendPrice;
	}
	
	public void setOrderSendPrice(Double orderSendPrice){
		this.orderSendPrice = orderSendPrice;
	}
	
	
	
	public String getOrderAudit(){
		return this.orderAudit;
	}
	
	public void setOrderAudit(String audit){
		this.orderAudit = audit;
	}

	public Integer getUserJifen(){
		return this.userJifen;
	}
	
	public void setUserJifen(Integer jifen){
		this.userJifen = jifen;
	}
}