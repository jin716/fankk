package com.ymai.hibernate;

/**
 * TgUserAndStoreId entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class TgUserAndStoreId implements java.io.Serializable {

	// Fields

	private TgUser tgUser;
	private Store store;

	// Constructors

	/** default constructor */
	public TgUserAndStoreId() {
	}

	/** full constructor */
	public TgUserAndStoreId(TgUser tgUser, Store store) {
		this.tgUser = tgUser;
		this.store = store;
	}

	// Property accessors

	public TgUser getTgUser() {
		return this.tgUser;
	}

	public void setTgUser(TgUser tgUser) {
		this.tgUser = tgUser;
	}

	public Store getStore() {
		return this.store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof TgUserAndStoreId))
			return false;
		TgUserAndStoreId castOther = (TgUserAndStoreId) other;

		return ((this.getTgUser() == castOther.getTgUser()) || (this
				.getTgUser() != null
				&& castOther.getTgUser() != null && this.getTgUser().equals(
				castOther.getTgUser())))
				&& ((this.getStore() == castOther.getStore()) || (this
						.getStore() != null
						&& castOther.getStore() != null && this.getStore()
						.equals(castOther.getStore())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getTgUser() == null ? 0 : this.getTgUser().hashCode());
		result = 37 * result
				+ (getStore() == null ? 0 : this.getStore().hashCode());
		return result;
	}

}