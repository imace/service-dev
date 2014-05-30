package com.sonymobile.sonysales.model;

public class FifaInfo {

	// Primary key
	private long id;

	// info
	private String info;

	// 注册时间Eg：201404101535
	private String createTime;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
}