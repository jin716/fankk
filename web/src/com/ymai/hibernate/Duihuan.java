package com.ymai.hibernate;

import java.util.Date;

/**
 * Duihuan entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Duihuan implements java.io.Serializable {

	// Fields
	final static public String STATE_NOT_PASS ="兑换失败";
	final static public String STATE_SHENQING ="申请中";
	final static public String STATE_PASS ="已通过";
	final static public String STATE_SEND ="已发出";
	
	private Integer duihuanId;
	private User user;
	private Gift gift;
	private Date time;
	private String detail;
	private Integer num;
	private Integer jifen;
	private String state;

	// Constructors

	/** default constructor */
	public Duihuan() {
	}

	/** minimal constructor */
	public Duihuan(User user, Gift gift) {
		this.user = user;
		this.gift = gift;
	}

	/** full constructor */
	public Duihuan(User user, Gift gift, Date time, String detail, Integer num,
			Integer jifen, String state) {
		this.user = user;
		this.gift = gift;
		this.time = time;
		this.detail = detail;
		this.num = num;
		this.jifen = jifen;
		this.state = state;
	}

	// Property accessors

	public Integer getDuihuanId() {
		return this.duihuanId;
	}

	public void setDuihuanId(Integer duihuanId) {
		this.duihuanId = duihuanId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Gift getGift() {
		return this.gift;
	}

	public void setGift(Gift gift) {
		this.gift = gift;
	}

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Integer getNum() {
		return this.num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Integer getJifen() {
		return this.jifen;
	}

	public void setJifen(Integer jifen) {
		this.jifen = jifen;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

}