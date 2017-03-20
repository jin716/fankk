package com.ymai.hibernate;

import java.util.Date;

/**
 * TgUserAndUser entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class TgUserAndUser implements java.io.Serializable {

	// Fields

	private TgUserAndUserId id;
	private Date time;

	// Constructors

	/** default constructor */
	public TgUserAndUser() {
	}

	/** minimal constructor */
	public TgUserAndUser(TgUserAndUserId id) {
		this.id = id;
	}

	/** full constructor */
	public TgUserAndUser(TgUserAndUserId id, Date time) {
		this.id = id;
		this.time = time;
	}

	// Property accessors

	public TgUserAndUserId getId() {
		return this.id;
	}

	public void setId(TgUserAndUserId id) {
		this.id = id;
	}

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

}