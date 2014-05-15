package com.sonymobile.sonysales.model;

public class OrderHistory {

	// Primary key
	private long id;

	private String orderNum;

	private String jdId;

	private String parentOrderNum;

	private int cashFlag;

	private int validOrder;

	// 注册时间Eg：201404101535
	private String createTime;

	public OrderHistory() {
		setOrderNum("");
		setJdId("");
		setParentOrderNum("");
		setCashFlag(0);
		setValidOrder(0);
		setCreateTime("");
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getJdId() {
		return jdId;
	}

	public void setJdId(String jdId) {
		this.jdId = jdId;
	}

	public String getParentOrderNum() {
		return parentOrderNum;
	}

	public void setParentOrderNum(String parentOrderNum) {
		this.parentOrderNum = parentOrderNum;
	}

	public int getCashFlag() {
		return cashFlag;
	}

	public void setCashFlag(int cashFlag) {
		this.cashFlag = cashFlag;
	}

	public int getValidOrder() {
		return validOrder;
	}

	public void setValidOrder(int validOrder) {
		this.validOrder = validOrder;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
}