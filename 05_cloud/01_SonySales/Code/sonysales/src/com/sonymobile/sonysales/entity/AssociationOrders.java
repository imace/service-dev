package com.sonymobile.sonysales.entity;

import java.util.List;

import com.sonymobile.sonysales.model.OrderHistory;

public class AssociationOrders {
	private OrderHistory ownerOrder;
	private String ownerNickName;
	private int validSupporterCount;

	private List<OrderHistory> supptorOrderList;
	private List<String> supporterNickNameList;
	private List<String> resultList;

	public OrderHistory getOwnerOrder() {
		return ownerOrder;
	}

	public void setOwnerOrder(OrderHistory ownerOrder) {
		this.ownerOrder = ownerOrder;
	}

	public String getOwnerNickName() {
		return ownerNickName;
	}

	public void setOwnerNickName(String ownerNickName) {
		this.ownerNickName = ownerNickName;
	}

	public int getValidSupporterCount() {
		return validSupporterCount;
	}

	public void setValidSupporterCount(int validSupporterCount) {
		this.validSupporterCount = validSupporterCount;
	}

	public List<OrderHistory> getSupptorOrderList() {
		return supptorOrderList;
	}

	public void setSupptorOrderList(List<OrderHistory> supptorOrderList) {
		this.supptorOrderList = supptorOrderList;
	}

	public List<String> getSupporterNickName() {
		return supporterNickNameList;
	}

	public void setSupporterNickName(List<String> supporterNickNameList) {
		this.supporterNickNameList = supporterNickNameList;
	}

	public List<String> getResultList() {
		return resultList;
	}

	public void setResultList(List<String> resultList) {
		this.resultList = resultList;
	}
}
