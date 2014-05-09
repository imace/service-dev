package com.sonymobile.sonysales.service;

import java.util.List;

import com.sonymobile.sonysales.dao.HandleDAO;
import com.sonymobile.sonysales.dao.UserDAO;

public class NameListService {

	// 获取人气榜
	public static List<?> getNameListOfPopularity(String limit) {
		return UserDAO.getUserList(limit, "points");
	}

	// 获取拉手榜
	public static List<?> getNameListOfHandle(String limit) {
		return HandleDAO.getSupporterList(limit);
	}
}
