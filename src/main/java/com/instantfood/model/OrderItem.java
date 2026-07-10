package com.instantfood.model;

import java.math.BigDecimal;

public class OrderItem {

	private int orderItemId;
	private int orderId;
	private int itemId;
	private int quantity;
	private BigDecimal price;

	// Display fields
	private String itemName;
	private String imageUrl;
	private boolean isVeg;

	public OrderItem() {
	}

	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public boolean isVeg() {
		return isVeg;
	}

	public void setVeg(boolean isVeg) {
		this.isVeg = isVeg;
	}
}