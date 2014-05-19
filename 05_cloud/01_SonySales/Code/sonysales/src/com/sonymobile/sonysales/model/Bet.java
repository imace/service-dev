package com.sonymobile.sonysales.model;

// Generated 2014-5-17 20:11:16 by Hibernate Tools 3.4.0.CR1

/**
 * Bet generated by hbm2java
 */
public class Bet {

	private long id;
	private long userId;
	private long matchId;
	private int betPointsOne;
	private int betPointsTwo;
	private long betPoints;
	private long winPoints;
	private String createTime;

	public Bet() {
	}

	public Bet(long id, long userId, long matchId, int betPointsOne,
			int betPointsTwo, int betPoints, int winPoints, String createTime) {
		this.id = id;
		this.userId = userId;
		this.matchId = matchId;
		this.betPointsOne = betPointsOne;
		this.betPointsTwo = betPointsTwo;
		this.betPoints = betPoints;
		this.winPoints = winPoints;
		this.createTime = createTime;
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getUserId() {
		return this.userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public long getMatchId() {
		return this.matchId;
	}

	public void setMatchId(long matchId) {
		this.matchId = matchId;
	}

	public int getBetPointsOne() {
		return this.betPointsOne;
	}

	public void setBetPointsOne(int betPointsOne) {
		this.betPointsOne = betPointsOne;
	}

	public int getBetPointsTwo() {
		return this.betPointsTwo;
	}

	public void setBetPointsTwo(int betPointsTwo) {
		this.betPointsTwo = betPointsTwo;
	}

	public long getBetPoints() {
		return this.betPoints;
	}

	public void setBetPoints(long betPoints) {
		this.betPoints = betPoints;
	}

	public long getWinPoints() {
		return this.winPoints;
	}

	public void setWinPoints(long winPoints) {
		this.winPoints = winPoints;
	}

	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}
