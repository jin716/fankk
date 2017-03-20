package com.ymai.hibernate;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * OrderEvaluate entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class OrderEvaluate implements java.io.Serializable {

	// Fields

	private Integer orderId;
	private User user;
	private Store store;
	private Order order;
	private String userName;
	private Integer orderStars;
	private Integer orderTaste;
	private Integer orderSpeed;
	private Integer orderHealth;
	private String orderDetail;
	private String orderComment;
	private Date evaluateTime;
	private String favorite;

	// Constructors

	/** default constructor */
	public OrderEvaluate() {
	}

	/** minimal constructor */
	public OrderEvaluate(Integer orderId, User user, Store store,
			Order orderTb) {
		this.orderId = orderId;
		this.user = user;
		this.store = store;
		this.order = orderTb;
	}

	/** full constructor */
	public OrderEvaluate(Integer orderId, User user, Store store,
			Order orderTb, String userName, Integer orderStars,
			Integer orderTaste, Integer orderSpeed, Integer orderHealth,
			String orderDetail, Date evaluateTime, String favorite) {
		this.orderId = orderId;
		this.user = user;
		this.store = store;
		this.order = orderTb;
		this.userName = userName;
		this.orderStars = orderStars;
		this.orderTaste = orderTaste;
		this.orderSpeed = orderSpeed;
		this.orderHealth = orderHealth;
		this.orderDetail = orderDetail;
		this.evaluateTime = evaluateTime;
		this.favorite = favorite;
	}

	// Property accessors

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
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

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order orderTb) {
		this.order = orderTb;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getOrderStars() {
		return this.orderStars;
	}

	public void setOrderStars(Integer orderStars) {
		this.orderStars = orderStars;
	}

	public Integer getOrderTaste() {
		return this.orderTaste;
	}

	public void setOrderTaste(Integer orderTaste) {
		this.orderTaste = orderTaste;
	}

	public Integer getOrderSpeed() {
		return this.orderSpeed;
	}

	public void setOrderSpeed(Integer orderSpeed) {
		this.orderSpeed = orderSpeed;
	}

	public Integer getOrderHealth() {
		return this.orderHealth;
	}

	public void setOrderHealth(Integer orderHealth) {
		this.orderHealth = orderHealth;
	}

	public String getOrderDetail() {
		return this.orderDetail;
	}

	public void setOrderDetail(String orderDetail) {
		this.orderDetail = orderDetail;
	}

	public Date getEvaluateTime() {
		return this.evaluateTime;
	}
	
	public String getEvaluateTimeString() {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(this.evaluateTime);
	}

	public void setEvaluateTime(Date evaluateTime) {
		this.evaluateTime = evaluateTime;
	}

	public String getFavorite() {
		return this.favorite;
	}

	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}
	
	public String getOrderComment(){
		return this.orderComment;
	}
	
	public void setOrderComment(String orderComment){
		this.orderComment = orderComment;
	}

}