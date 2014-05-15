package com.sonymobile.sonysales.model;

public class Product {

	// Primary key
	private long id;

	private String name;

	private String description;

	private String iconLink;

	private String jdLink;

	private long price;

	// create time . 201404101535
	private String createTime;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIconLink() {
		return iconLink;
	}

	public void setIconLink(String iconLink) {
		this.iconLink = iconLink;
	}

	public String getJdLink() {
		return jdLink;
	}

	public void setJdLink(String jdLink) {
		this.jdLink = jdLink;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
}