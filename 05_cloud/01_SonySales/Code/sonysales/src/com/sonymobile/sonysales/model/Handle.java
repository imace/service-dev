package com.sonymobile.sonysales.model;

public class Handle {

	//Primary key
	private long id;

	//发起人或者叫推荐者的用户Id(外键，User表主键)
	private long ownerUserId;
	
	//支持者，被推荐者或者叫接收者用户Id(外键，User表主键)
	private long supporterUserId;
	
	//人气关联创建时间Eg：201404101535
	private String createTime;

	public Handle(){
		setOwnerUserId(-1);
		setSupporterUserId(-1);
	}
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getOwnerUserId() {
		return ownerUserId;
	}

	public void setOwnerUserId(long id) {
		this.ownerUserId = id;
	}

	public long getSupporterUserId() {
		return supporterUserId;
	}

	public void setSupporterUserId(long id) {
		this.supporterUserId = id;
	}
	
	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
}
