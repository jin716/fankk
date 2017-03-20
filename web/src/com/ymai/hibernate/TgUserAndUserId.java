package com.ymai.hibernate;

/**
 * TgUserAndUserId entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class TgUserAndUserId implements java.io.Serializable {

	// Fields

	private TgUser tgUser;
	private User user;

	// Constructors

	/** default constructor */
	public TgUserAndUserId() {
	}

	/** full constructor */
	public TgUserAndUserId(TgUser tgUser, User user) {
		this.tgUser = tgUser;
		this.user = user;
	}

	// Property accessors

	public TgUser getTgUser() {
		return this.tgUser;
	}

	public void setTgUser(TgUser tgUser) {
		this.tgUser = tgUser;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof TgUserAndUserId))
			return false;
		TgUserAndUserId castOther = (TgUserAndUserId) other;

		return ((this.getTgUser() == castOther.getTgUser()) || (this
				.getTgUser() != null
				&& castOther.getTgUser() != null && this.getTgUser().equals(
				castOther.getTgUser())))
				&& ((this.getUser() == castOther.getUser()) || (this.getUser() != null
						&& castOther.getUser() != null && this.getUser()
						.equals(castOther.getUser())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getTgUser() == null ? 0 : this.getTgUser().hashCode());
		result = 37 * result
				+ (getUser() == null ? 0 : this.getUser().hashCode());
		return result;
	}

}