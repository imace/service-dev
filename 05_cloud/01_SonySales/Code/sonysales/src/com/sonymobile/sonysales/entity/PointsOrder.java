package com.sonymobile.sonysales.entity;

public class PointsOrder {

	// 昵称
	private String nickname;

	// 0：未关注sony 微信，1：已关注sony微信
	private int focusFlag;

	// 电话
	private String phoneNum;

	// 邮箱
	private String email;

	// 地址
	private String address;

	// 京东账户
	private String jdId;

	// 人气值
	private long points;

	// 关注时间Eg：201404101535
	private String focusTime;

	// 注册时间Eg：201404101535
	private String createTime;

	private String pointsOrder;

	public PointsOrder(String nickname, int focusFlag, String phoneNum,
			String email, String address, String jdId, long points,
			String focusTime, String createTime, Object pointsOrder) {
		this.nickname = nickname;
		this.focusFlag = focusFlag;
		this.phoneNum = phoneNum;
		this.email = email;
		this.address = address;
		this.jdId = jdId;
		this.points = points;
		this.focusTime = focusTime;
		this.createTime = createTime;
		this.pointsOrder = pointsOrder.toString();
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

	public long getPoints() {
		return points;
	}

	public void setPoints(long points) {
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

	public String getPointsOrder() {
		return pointsOrder;
	}

	public void setPointsOrder(String pointsOrder) {
		this.pointsOrder = pointsOrder;
	}
}