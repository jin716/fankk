package com.ymai.hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * Item entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Item implements java.io.Serializable {

	// Fields

	private Integer itemId;
	private Store store;
	private String itemName;
	private String itemImgSrc;
	private String itemDetail;
	private Double itemPrice;
	private Double itemDsct;
	private Integer itemWeeklyOrder;
	private Integer itemTotalOrder;
	private String itemType;
	private Integer itemRecommend;
	private String itemState;
	private Set orderItemses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Item() {
	}

	/** minimal constructor */
	public Item(Store store, String itemName, Double itemPrice, Double itemDsct) {
		this.store = store;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemDsct = itemDsct;
	}

	/** full constructor */
	public Item(Store store, String itemName, String itemImgSrc,
			String itemDetail, Double itemPrice, Double itemDsct,
			Integer itemWeeklyOrder, Integer itemTotalOrder, String itemType,
			Integer itemRecommend, String itemState, Set orderItemses) {
		this.store = store;
		this.itemName = itemName;
		this.itemImgSrc = itemImgSrc;
		this.itemDetail = itemDetail;
		this.itemPrice = itemPrice;
		this.itemDsct = itemDsct;
		this.itemWeeklyOrder = itemWeeklyOrder;
		this.itemTotalOrder = itemTotalOrder;
		this.itemType = itemType;
		this.itemRecommend = itemRecommend;
		this.itemState = itemState;
		this.orderItemses = orderItemses;
	}

	// Property accessors

	public Integer getItemId() {
		return this.itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public Store getStore() {
		return this.store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public String getItemName() {
		return this.itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemImgSrc() {
		return this.itemImgSrc;
	}

	public void setItemImgSrc(String itemImgSrc) {
		this.itemImgSrc = itemImgSrc;
	}

	public String getItemDetail() {
		return this.itemDetail;
	}

	public void setItemDetail(String itemDetail) {
		this.itemDetail = itemDetail;
	}

	public Double getItemPrice() {
		return this.itemPrice;
	}

	public void setItemPrice(Double itemPrice) {
		this.itemPrice = itemPrice;
	}

	public Double getItemDsct() {
		return this.itemDsct;
	}

	public void setItemDsct(Double itemDsct) {
		this.itemDsct = itemDsct;
	}

	public Integer getItemWeeklyOrder() {
		return this.itemWeeklyOrder;
	}

	public void setItemWeeklyOrder(Integer itemWeeklyOrder) {
		this.itemWeeklyOrder = itemWeeklyOrder;
	}

	public Integer getItemTotalOrder() {
		return this.itemTotalOrder;
	}

	public void setItemTotalOrder(Integer itemTotalOrder) {
		this.itemTotalOrder = itemTotalOrder;
	}

	public String getItemType() {
		return this.itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public Integer getItemRecommend() {
		return this.itemRecommend;
	}

	public void setItemRecommend(Integer itemRecommend) {
		this.itemRecommend = itemRecommend;
	}

	public String getItemState() {
		return this.itemState;
	}

	public void setItemState(String itemState) {
		this.itemState = itemState;
	}

	public Set getOrderItemses() {
		return this.orderItemses;
	}

	public void setOrderItemses(Set orderItemses) {
		this.orderItemses = orderItemses;
	}

}