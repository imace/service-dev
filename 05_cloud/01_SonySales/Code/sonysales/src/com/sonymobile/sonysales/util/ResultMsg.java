package com.sonymobile.sonysales.util;

import java.util.HashMap;
import java.util.Map;

public class ResultMsg {
	public static final String RESULT_CODE_KEY = "ResultCode";
	public static final String RESULT_CODE_DESCRIPTION = "Discription";

	public static final int RESULT_CODE_SUCESS = 1;
	public static final int RESULT_CODE_ERROR = 0;

	private static final String RESULT_DES_SUCESS = "success.";

	private static final String ERROR_DES_OPENID_ISNULL = "open id is null.";
	private static final String ERROR_DES_OPENID_EXISTS = "open id exists already.";
	private static final String ERROR_DES_JDID_EXISTS = "jd id exists already.";
	private static final String ERROR_DES_SAMEROW_EXISTS = "the same record exists already in ";
	private static final String ERROR_DES_OPERAION_DB_FAIL = "database operation fail in ";

	private static final String ERROR_DES_OWNEROPENID_NOTEXISTS = "owner open id not exists.";
	private static final String ERROR_DES_SUPPORTEROPENID_NOTEXISTS = "supporter open id not exists.";
	private static final String ERROR_DES_INVALID_OWNERID = "Invalid JD ower order id";

	private static final String ERROR_DES_ORDERNUM_EXISTS = "order num exists already.";

	private static final String ERROR_DES_PARAMETER_ERROR = "input parameter error.";
	private static final String ERROR_DES_POINTSNOTENOUGH_ERROR = "points not enough error.";
	// / <summary>
	// / success result info
	// / </summary>
	// / <returns></returns>
	public static Map<?, ?> SuccessInfo() {
		return GetResultMsg(RESULT_CODE_SUCESS, RESULT_DES_SUCESS);
	}

	// / <summary>
	// / openId is null
	// / </summary>
	// / <returns></returns>
	public static Map<?, ?> OpenIDIsNull() {
		return GetResultMsg(RESULT_CODE_ERROR, ERROR_DES_OPENID_ISNULL);
	}

	// / <summary>
	// / openId already exist
	// / </summary>
	// / <returns></returns>
	public static Map<?, ?> OpenIDExistsError() {
		return GetResultMsg(RESULT_CODE_ERROR, ERROR_DES_OPENID_EXISTS);
	}

	// / <summary>
	// / JdId already exist
	// / </summary>
	// / <returns></returns>
	public static Map<?, ?> JdIDExistsError() {
		return GetResultMsg(RESULT_CODE_ERROR, ERROR_DES_JDID_EXISTS);
	}

	// / <summary>
	// / db operation fail.
	// / </summary>
	// / <returns></returns>
	public static Map<?, ?> FailInOperatingDBError(String ope) {
		return GetResultMsg(RESULT_CODE_ERROR, ERROR_DES_OPERAION_DB_FAIL + ope);
	}

	// / <summary>
	// / owner open id not exist
	// / </summary>
	// / <returns></returns>
	public static Map<?, ?> OwnerOpenIDNotExistsError() {
		return GetResultMsg(RESULT_CODE_ERROR, ERROR_DES_OWNEROPENID_NOTEXISTS);
	}

	// <summary>
	// supporter open id not exist
	// </summary>
	// <returns></returns>
	public static Map<?, ?> SupporterOpenIDNotExistsError() {
		return GetResultMsg(RESULT_CODE_ERROR,
				ERROR_DES_SUPPORTEROPENID_NOTEXISTS);
	}

	// <summary>
	// the record already exist in table
	// </summary>
	// <returns></returns>
	public static Map<?, ?> SameRecordExistInTable(String tableName) {
		return GetResultMsg(RESULT_CODE_ERROR, ERROR_DES_SAMEROW_EXISTS
				+ tableName);
	}

	private static Map<?, ?> GetResultMsg(int code, String des) {
		Map<String, String> ret = new HashMap<String, String>();
		ret.put(RESULT_CODE_KEY, String.valueOf(code));
		ret.put(RESULT_CODE_DESCRIPTION, des);

		return ret;
	}

	public static Map<?, ?> OrderNumExistsError() {
		return GetResultMsg(RESULT_CODE_ERROR, ERROR_DES_ORDERNUM_EXISTS);
	}

	public static Map<?, ?> ParameterError() {
		return GetResultMsg(RESULT_CODE_ERROR, ERROR_DES_PARAMETER_ERROR);
	}
	
	public static Map<?, ?> PointsNotEnoughError() {
		return GetResultMsg(RESULT_CODE_ERROR, ERROR_DES_POINTSNOTENOUGH_ERROR);
	}
}