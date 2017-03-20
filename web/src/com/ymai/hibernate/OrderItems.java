package com.ymai.hibernate;

/**
 * OrderItems entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class OrderItems implements java.io.Serializable {

	// Fields

	private Integer orderItemId;
	private Item item;
	private String itemName;
	private Order order;
	private Integer itemNum;
	private Double itemTotalPrice;

	// Constructors

	/** default constructor */
	public OrderItems() {
	}

	/** minimal constructor */
	public OrderItems(Order order, Integer itemNum) {
		this.order = order;
		this.itemNum = itemNum;
	}

	/** full constructor */
	public OrderItems(Item item, Order order, Integer itemNum,
			Double itemTotolPrice) {
		this.item = item;
		this.order = order;
		this.itemNum = itemNum;
		this.itemTotalPrice = itemTotolPrice;
	}

	// Property accessors

	public Integer getOrderItemId() {
		return this.orderItemId;
	}

	public void setOrderItemId(Integer oerderItemId) {
		this.orderItemId = oerderItemId;
	}

	public Item getItem() {
		return this.item;
	}

	public void setItem(Item item) {
		this.item = item;
	}
	
	public String getItemName() {
		return this.itemName;
	}

	public void setItemName(String name) {
		this.itemName = name;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Integer getItemNum() {
		return this.itemNum;
	}

	public void setItemNum(Integer itemNum) {
		this.itemNum = itemNum;
	}

	public Double getItemTotalPrice() {
		return this.itemTotalPrice;
	}

	public void setItemTotalPrice(Double itemTotolPrice) {
		this.itemTotalPrice = itemTotolPrice;
	}

}