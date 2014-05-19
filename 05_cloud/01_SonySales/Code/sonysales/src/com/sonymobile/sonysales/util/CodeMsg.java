package com.sonymobile.sonysales.util;

import java.util.HashMap;
import java.util.Map;

public class CodeMsg {
	public static final String RESULT_CODE_KEY = "ResultCode";
	public static final String RESULT_CODE_DESCRIPTION = "Discription";
	
	public static final int CODE_ADD_ADMINISTRATOR_SUCCESS = 100;
	public static final int CODE_ADD_ADMINISTRATOR_FAILURE = 101;
	public static final int CODE_USERADMIN_USERNAME_EXSISTS = 102;
	

	public static Map<?, ?> GetCodeMsg(int code, String des) {
		Map<String, String> codeMsg = new HashMap<String, String>();
		codeMsg.put(RESULT_CODE_KEY, String.valueOf(code));
		codeMsg.put(RESULT_CODE_DESCRIPTION, des);
		return codeMsg;
	}

}