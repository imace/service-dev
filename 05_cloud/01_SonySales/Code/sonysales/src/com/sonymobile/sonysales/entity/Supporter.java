package com.sonymobile.sonysales.entity;

public class Supporter {
	// 昵称
	private String nickname;

	private String createTime;

	public Supporter() {

	}

	public Supporter(String nickname, String createTime) {
		this.nickname = nickname;
		this.createTime = createTime;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
}
