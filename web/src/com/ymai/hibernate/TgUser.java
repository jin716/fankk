package com.ymai.hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * TgUser entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class TgUser implements java.io.Serializable {

	// Fields

	private String id;
	private String password;
	private String email;
	private String mobile;
	private String name;
	private Double account;
	private Byte apply;
	private Integer state;
	private String key;
	private Set tgUserAndUsers = new HashSet(0);
	private Set tgUserAndStores = new HashSet(0);

	// Constructors

	/** default constructor */
	public TgUser() {
	}

	/** minimal constructor */
	public TgUser(String id, String password, String email, String mobile,
			String name) {
		this.id = id;
		this.password = password;
		this.email = email;
		this.mobile = mobile;
		this.name = name;
	}

	/** full constructor */
	public TgUser(String id, String password, String email, String mobile,
			String name, Double account, Byte apply, Integer state, String key,
			Set tgUserAndUsers, Set tgUserAndStores) {
		this.id = id;
		this.password = password;
		this.email = email;
		this.mobile = mobile;
		this.name = name;
		this.account = account;
		this.apply = apply;
		this.state = state;
		this.key = key;
		this.tgUserAndUsers = tgUserAndUsers;
		this.tgUserAndStores = tgUserAndStores;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getAccount() {
		return this.account;
	}

	public void setAccount(Double account) {
		this.account = account;
	}

	public Byte getApply() {
		return this.apply;
	}

	public void setApply(Byte apply) {
		this.apply = apply;
	}

	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getKey() {
		return this.key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public Set getTgUserAndUsers() {
		return this.tgUserAndUsers;
	}

	public void setTgUserAndUsers(Set tgUserAndUsers) {
		this.tgUserAndUsers = tgUserAndUsers;
	}

	public Set getTgUserAndStores() {
		return this.tgUserAndStores;
	}

	public void setTgUserAndStores(Set tgUserAndStores) {
		this.tgUserAndStores = tgUserAndStores;
	}

}