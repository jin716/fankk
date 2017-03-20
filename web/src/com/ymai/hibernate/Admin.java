package com.ymai.hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * Admin entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Admin implements java.io.Serializable {

	// Fields

	private String adminId;
	private String password;
	private Set roles = new HashSet(0);

	// Constructors

	/** default constructor */
	public Admin() {
	}

	/** minimal constructor */
	public Admin(String adminId, String password) {
		this.adminId = adminId;
		this.password = password;
	}

	/** full constructor */
	public Admin(String adminId, String password, Set roleAdmins) {
		this.adminId = adminId;
		this.password = password;
		this.roles = roleAdmins;
	}

	// Property accessors

	public String getAdminId() {
		return this.adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set getRoles() {
		return this.roles;
	}

	public void setRoles(Set roleAdmins) {
		this.roles = roleAdmins;
	}

}