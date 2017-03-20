package com.ymai.hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * Role entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Role implements java.io.Serializable {

	// Fields

	private Integer roleId;
	private String roleName;
	private String roleDetail;
	private Set roleAdmins = new HashSet(0);

	// Constructors

	/** default constructor */
	public Role() {
	}

	/** full constructor */
	public Role(String roleName, String roleDetail, Set roleAdmins) {
		this.roleName = roleName;
		this.roleDetail = roleDetail;
		this.roleAdmins = roleAdmins;
	}

	// Property accessors

	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDetail() {
		return this.roleDetail;
	}

	public void setRoleDetail(String roleDetail) {
		this.roleDetail = roleDetail;
	}

	public Set getRoleAdmins() {
		return this.roleAdmins;
	}

	public void setRoleAdmins(Set roleAdmins) {
		this.roleAdmins = roleAdmins;
	}

}