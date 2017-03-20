package com.ymai.hibernate;

import java.util.Date;

/**
 * AdminUser entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class AdminUser implements java.io.Serializable {

	// Fields

	private Integer userId;
	private User user;
	private Date userRegisterTime;

	// Constructors

	/** default constructor */
	public AdminUser() {
	}

	/** full constructor */
	public AdminUser(Integer userId, User user, Date userRegisterTime) {
		this.userId = userId;
		this.user = user;
		this.userRegisterTime = userRegisterTime;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getUserRegisterTime() {
		return this.userRegisterTime;
	}

	public void setUserRegisterTime(Date userRegisterTime) {
		this.userRegisterTime = userRegisterTime;
	}


}