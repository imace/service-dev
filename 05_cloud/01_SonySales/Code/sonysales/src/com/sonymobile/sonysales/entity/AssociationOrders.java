package com.sonymobile.sonysales.entity;

import java.util.List;

public class AssociationOrders {
	private OrderInfo ownerOrder;
	private int validSupporterCount;

	private List<OrderInfo> supptorOrderList;

	public OrderInfo getOwnerOrder() {
		return ownerOrder;
	}

	public void setOwnerOrder(OrderInfo ownerOrder) {
		this.ownerOrder = ownerOrder;
	}

	public int getValidSupporterCount() {
		return validSupporterCount;
	}

	public void setValidSupporterCount(int validSupporterCount) {
		this.validSupporterCount = validSupporterCount;
	}

	public List<OrderInfo> getSupptorOrderList() {
		return supptorOrderList;
	}

	public void setSupptorOrderList(List<OrderInfo> supptorOrderList) {
		this.supptorOrderList = supptorOrderList;
	}
}
