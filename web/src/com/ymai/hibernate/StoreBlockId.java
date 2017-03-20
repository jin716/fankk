package com.ymai.hibernate;

/**
 * StoreBlockId entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class StoreBlockId implements java.io.Serializable {

	// Fields

	private Store store;
	private Block block;

	// Constructors

	/** default constructor */
	public StoreBlockId() {
	}

	/** full constructor */
	public StoreBlockId(Store store, Block block) {
		this.store = store;
		this.block = block;
	}

	// Property accessors

	public Store getStore() {
		return this.store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public Block getBlock() {
		return this.block;
	}

	public void setBlock(Block block) {
		this.block = block;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof StoreBlockId))
			return false;
		StoreBlockId castOther = (StoreBlockId) other;

		return ((this.getStore() == castOther.getStore()) || (this.getStore() != null
				&& castOther.getStore() != null && this.getStore().equals(
				castOther.getStore())))
				&& ((this.getBlock() == castOther.getBlock()) || (this
						.getBlock() != null
						&& castOther.getBlock() != null && this.getBlock()
						.equals(castOther.getBlock())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getStore() == null ? 0 : this.getStore().hashCode());
		result = 37 * result
				+ (getBlock() == null ? 0 : this.getBlock().hashCode());
		return result;
	}

}