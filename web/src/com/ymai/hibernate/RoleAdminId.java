package com.ymai.hibernate;

/**
 * RoleAdminId entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class RoleAdminId implements java.io.Serializable {

	// Fields

	private Role role;
	private Admin admin;

	// Constructors

	/** default constructor */
	public RoleAdminId() {
	}

	/** full constructor */
	public RoleAdminId(Role role, Admin admin) {
		this.role = role;
		this.admin = admin;
	}

	// Property accessors

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Admin getAdmin() {
		return this.admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof RoleAdminId))
			return false;
		RoleAdminId castOther = (RoleAdminId) other;

		return ((this.getRole() == castOther.getRole()) || (this.getRole() != null
				&& castOther.getRole() != null && this.getRole().equals(
				castOther.getRole())))
				&& ((this.getAdmin() == castOther.getAdmin()) || (this
						.getAdmin() != null
						&& castOther.getAdmin() != null && this.getAdmin()
						.equals(castOther.getAdmin())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getRole() == null ? 0 : this.getRole().hashCode());
		result = 37 * result
				+ (getAdmin() == null ? 0 : this.getAdmin().hashCode());
		return result;
	}

}