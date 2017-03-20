package com.ymai.hibernate;

/**
 * StoreBlock entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class StoreBlock implements java.io.Serializable {

	// Fields

	private StoreBlockId id;
	private Byte isSend;
	private Float distance;

	// Constructors

	/** default constructor */
	public StoreBlock() {
	}

	/** minimal constructor */
	public StoreBlock(StoreBlockId id, Byte isSend) {
		this.id = id;
		this.isSend = isSend;
	}

	/** full constructor */
	public StoreBlock(StoreBlockId id, Byte isSend, Float distance) {
		this.id = id;
		this.isSend = isSend;
		this.distance = distance;
	}

	// Property accessors

	public StoreBlockId getId() {
		return this.id;
	}

	public void setId(StoreBlockId id) {
		this.id = id;
	}

	public Byte getIsSend() {
		return this.isSend;
	}

	public void setIsSend(Byte isSend) {
		this.isSend = isSend;
	}

	public Float getDistance() {
		return this.distance;
	}

	public void setDistance(Float distance) {
		this.distance = distance;
	}

}