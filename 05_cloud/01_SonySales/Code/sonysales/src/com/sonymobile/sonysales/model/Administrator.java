package com.sonymobile.sonysales.model;

public class Administrator {

	//Primary key
	private long id;
	
	//用户名
	private String userName;
	
	//密码
	private String password;
	
	//0：删除，1：启用，2：禁用
	private int state; 
	
    //创建时间Eg：201404101535
 private String createTime;
	
    //权限id
	private long permissionId;
	
    public Administrator(){
        setPermissionId(0);
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public long getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(long permissionId) {
        this.permissionId = permissionId;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
	

}