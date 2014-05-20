package com.sonymobile.sonysales.model;

public class Permission {

	//Primary key
	private long id;
	
	//权限码
	private String code;
	
	//权限名称
	private String name;
	
    //创建时间Eg：201404101535
 private String createTime;

public long getId() {
    return id;
}

public void setId(long id) {
    this.id = id;
}

public String getCode() {
    return code;
}

public void setCode(String code) {
    this.code = code;
}

public String getName() {
    return name;
}

public void setName(String name) {
    this.name = name;
}

public String getCreateTime() {
    return createTime;
}

public void setCreateTime(String createTime) {
    this.createTime = createTime;
}
	

}