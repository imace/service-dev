package com.sonymobile.sonysales.model;

// Generated 2014-5-17 20:11:16 by Hibernate Tools 3.4.0.CR1


/**
 * Match generated by hbm2java
 */
public class Match {

	private long id;
	private String countryOne;
	private String countryTwo;
	private int pointsOne;
	private int pointsTwo;
	private String startTime;
	private String createTime;

	public Match() {
	}

	public Match(long id, String countryOne, String countryTwo, int pointsOne,
			int pointsTwo, String startTime, String createTime) {
		this.id = id;
		this.countryOne = countryOne;
		this.countryTwo = countryTwo;
		this.pointsOne = pointsOne;
		this.pointsTwo = pointsTwo;
		this.startTime = startTime;
		this.createTime = createTime;
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCountryOne() {
		return this.countryOne;
	}

	public void setCountryOne(String countryOne) {
		this.countryOne = countryOne;
	}

	public String getCountryTwo() {
		return this.countryTwo;
	}

	public void setCountryTwo(String countryTwo) {
		this.countryTwo = countryTwo;
	}

	public int getPointsOne() {
		return this.pointsOne;
	}

	public void setPointsOne(int pointsOne) {
		this.pointsOne = pointsOne;
	}

	public int getPointsTwo() {
		return this.pointsTwo;
	}

	public void setPointsTwo(int pointsTwo) {
		this.pointsTwo = pointsTwo;
	}

	public String getStartTime() {
		return this.startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}