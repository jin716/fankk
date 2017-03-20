package com.ymai.hibernate;

import java.util.Date;

/**
 * TgUserAndStore entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class TgUserAndStore implements java.io.Serializable {

	// Fields

	private TgUserAndStoreId id;
	private Date time;

	// Constructors

	/** default constructor */
	public TgUserAndStore() {
	}

	/** minimal constructor */
	public TgUserAndStore(TgUserAndStoreId id) {
		this.id = id;
	}

	/** full constructor */
	public TgUserAndStore(TgUserAndStoreId id, Date time) {
		this.id = id;
		this.time = time;
	}

	// Property accessors

	public TgUserAndStoreId getId() {
		return this.id;
	}

	public void setId(TgUserAndStoreId id) {
		this.id = id;
	}

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

}