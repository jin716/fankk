package com.ymai.hibernate;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * StoreComnt entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class StoreComnt implements java.io.Serializable {

	// Fields

	private Integer storeComntId;
	private User user;
	private Store store;
	private String storeComntDetail;
	private Date storeComntTime;
	private Integer storeComntFlag;
	private String userName;

	// Constructors

	/** default constructor */
	public StoreComnt() {
	}

	/** minimal constructor */
	public StoreComnt(Integer storeComntId, Store store, Date storeComntTime) {
		this.storeComntId = storeComntId;
		this.store = store;
		this.storeComntTime = storeComntTime;
	}

	/** full constructor */
	public StoreComnt(Integer storeComntId, User user, Store store, String storeComntDetail,
			Date storeComntTime, Integer storeComntFlag, String userName) {
		this.storeComntId = storeComntId;
		this.user = user;
		this.store = store;
		this.storeComntDetail = storeComntDetail;
		this.storeComntTime = storeComntTime;
		this.storeComntFlag = storeComntFlag;
		this.userName = userName;
	}

	// Property accessors

	public Integer getStoreComntId() {
		return this.storeComntId;
	}

	public void setStoreComntId(Integer storeComntId) {
		this.storeComntId = storeComntId;
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

	public String getStoreComntDetail() {
		return this.storeComntDetail;
	}

	public void setStoreComntDetail(String storeComntDetail) {
		this.storeComntDetail = storeComntDetail;
	}

	public Date getStoreComntTime() {
		return this.storeComntTime;
	}

	public void setStoreComntTime(Date storeComntTime) {
		this.storeComntTime = storeComntTime;
	}

	public Integer getStoreComntFlag() {
		return this.storeComntFlag;
	}

	public void setStoreComntFlag(Integer storeComntFlag) {
		this.storeComntFlag = storeComntFlag;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getStoreComntTimeString() {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(this.storeComntTime);
	}

}