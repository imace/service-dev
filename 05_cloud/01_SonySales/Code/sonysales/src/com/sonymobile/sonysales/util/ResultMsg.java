package com.sonymobile.sonysales.util;

import java.util.HashMap;
import java.util.Map;

public class ResultMsg {

	// / 返回码。0 请求失败, 1 请求成功,
	private int ResultCode;

	// 错误描述
	private String Discription;

	private static final int RESULT_CODE_SUCESS = 1;
	private static final int RESULT_CODE_ERROR = 0;

	private static final String RESULT_DES_SUCESS = "success.";
	
	private static final String ERROR_DES_OPENID_EXISTS = "open id exists already.";
	private static final String ERROR_DES_JDID_EXISTS = "jd id exists already.";
	private static final String ERROR_DES_OPERAION_DB_FAIL = "database operation fail in ";

	
	private static final String ERROR_DES_OWNEROPENID_NOTEXISTS = "owner open id not exists.";
	private static final String ERROR_DES_SUPPORTEROPENID_NOTEXISTS = "supporter open id not exists.";
	// / <summary>
	// / openId已经存在
	// / </summary>
	// / <returns></returns>
	public static Map SuccessInfo() {
		return GetResultMsg(RESULT_CODE_SUCESS, RESULT_DES_SUCESS);
	}

	// / <summary>
	// / openId已经存在
	// / </summary>
	// / <returns></returns>
	public static Map OpenIDExistsError() {
		return GetResultMsg(RESULT_CODE_ERROR, ERROR_DES_OPENID_EXISTS);
	}

	// / <summary>
	// / JdId已经存在
	// / </summary>
	// / <returns></returns>
	public static Map JdIDExistsError() {
		return GetResultMsg(RESULT_CODE_ERROR, ERROR_DES_JDID_EXISTS);
	}

	// / <summary>
	// / JdId已经存在
	// / </summary>
	// / <returns></returns>
	public static Map FailInOperatingDBError(String ope) {
		return GetResultMsg(RESULT_CODE_ERROR, ERROR_DES_OPERAION_DB_FAIL + ope);
	}

	// / <summary>
	// / openId已经存在
	// / </summary>
	// / <returns></returns>
	public static Map OwnerOpenIDNotExistsError() {
		return GetResultMsg(RESULT_CODE_ERROR, ERROR_DES_OWNEROPENID_NOTEXISTS);
	}
	
	// / <summary>
	// / openId已经存在
	// / </summary>
	// / <returns></returns>
	public static Map SupporterOpenIDNotExistsError() {
		return GetResultMsg(RESULT_CODE_ERROR, ERROR_DES_SUPPORTEROPENID_NOTEXISTS);
	}
	
	private static Map GetResultMsg(int code, String des) {
		Map ret = new HashMap();
		ret.put("ResultCode", code);
		ret.put("Discription", des);

		System.out.print("ResultCode: " + code + " Discription: " + des);
		return ret;
	}
}