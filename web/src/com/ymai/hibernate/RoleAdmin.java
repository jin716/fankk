package com.ymai.hibernate;

/**
 * RoleAdmin entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class RoleAdmin implements java.io.Serializable {

	// Fields

	private RoleAdminId id;

	// Constructors

	/** default constructor */
	public RoleAdmin() {
	}

	/** full constructor */
	public RoleAdmin(RoleAdminId id) {
		this.id = id;
	}

	// Property accessors

	public RoleAdminId getId() {
		return this.id;
	}

	public void setId(RoleAdminId id) {
		this.id = id;
	}

}