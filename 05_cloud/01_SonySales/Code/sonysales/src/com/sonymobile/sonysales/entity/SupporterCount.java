package com.sonymobile.sonysales.entity;

public class SupporterCount {
	// 昵称
	private String nickname;
	// 支持者数量
	private String count;

	public SupporterCount() {

	}

	public SupporterCount(String nickname, Object count) {
		this.nickname = nickname;
		this.count = count.toString();
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}
}
