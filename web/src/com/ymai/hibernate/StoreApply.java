package com.ymai.hibernate;

import java.util.Date;

/**
 * StoreApply entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class StoreApply implements java.io.Serializable {

	public final static int STATE_UN_READED = 0;
	public final static int STATE_READED    = 1;
	public final static int STATE_PROCESSED = 2;
	// Fields

	private Integer appId;
	private String appName;
	private String appStoreName;
	private String appStoreAddr;
	private String appMessage;
	private Date appTime;
	private Long appState;
	private String appTele;
	// Constructors

	/** default constructor */
	public StoreApply() {
	}

	/** full constructor */
	public StoreApply(String appName, String appStoreName, String appStoreAddr,
			String appMessage, Date appTime, Long appState) {
		this.appName = appName;
		this.appStoreName = appStoreName;
		this.appStoreAddr = appStoreAddr;
		this.appMessage = appMessage;
		this.appTime = appTime;
		this.appState = appState;
	}

	// Property accessors

	public Integer getAppId() {
		return this.appId;
	}

	public void setAppId(Integer appId) {
		this.appId = appId;
	}

	public String getAppName() {
		return this.appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getAppStoreName() {
		return this.appStoreName;
	}

	public void setAppStoreName(String appStoreName) {
		this.appStoreName = appStoreName;
	}

	public String getAppStoreAddr() {
		return this.appStoreAddr;
	}

	public void setAppStoreAddr(String appStoreAddr) {
		this.appStoreAddr = appStoreAddr;
	}

	public String getAppMessage() {
		return this.appMessage;
	}

	public void setAppMessage(String appMessage) {
		this.appMessage = appMessage;
	}

	public Date getAppTime() {
		return this.appTime;
	}

	public void setAppTime(Date appTime) {
		this.appTime = appTime;
	}

	public Long getAppState() {
		return this.appState;
	}

	public void setAppState(Long appState) {
		this.appState = appState;
	}
	public void setAppTele(String tele){
		this.appTele = tele;
	}
	public String getAppTele(){
		return this.appTele;
	}
	
	public String getState() {
		int state = this.appState.intValue();
		switch(state){
			case STATE_UN_READED : return "未读";
			case STATE_READED    : return "已读";
			case STATE_PROCESSED : return "已处理";
		}
		return null;
	}
}