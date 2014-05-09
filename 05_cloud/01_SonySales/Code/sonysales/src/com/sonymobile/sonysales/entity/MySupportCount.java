package com.sonymobile.sonysales.entity;

public class MySupportCount {
	
	//Primary key
	private long id;
	
	//昵称
	private String nickname;
	
	//支持者数量
	private String count;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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
