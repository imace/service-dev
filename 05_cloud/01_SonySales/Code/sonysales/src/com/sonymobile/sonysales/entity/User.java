package com.sonymobile.sonysales.entity;

public class User {
	
	//Primary key
	private long id;
	
	//微信OpenID
	private String openId;
	
	//昵称
	private String nickname;
	
	//0：未关注sony 微信，1：已关注sony微信
	private int focusFlag;
	
	//电话
	private String phoneNum;

	//邮箱
	private String email;
	
	//地址
	private String address;
	
	//京东账户
	private String jdId;
	
	//人气值
	private String points;

	//关注时间Eg：201404101535
	private String focusTime;
	
	//注册时间Eg：201404101535
	private String createTime;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getFocusFlag() {
		return focusFlag;
	}

	public void setFocusFlag(int focusFlag) {
		this.focusFlag = focusFlag;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getJdId() {
		return jdId;
	}

	public void setJdId(String jdId) {
		this.jdId = jdId;
	}

	public String getPoints() {
		return points;
	}

	public void setPoints(String points) {
		this.points = points;
	}

	public String getFocusTime() {
		return focusTime;
	}

	public void setFocusTime(String focusTime) {
		this.focusTime = focusTime;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}
