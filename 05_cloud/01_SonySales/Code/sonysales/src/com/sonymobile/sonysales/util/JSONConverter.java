package com.sonymobile.sonysales.util;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

public final class JSONConverter {
	private static Logger logger = Logger.getLogger(JSONConverter.class);

	/**
	 * Convert a json string to an JSONObject and return null if there is some json exception occur
	 * */
	public static JSONObject convertString2JSONObject(String jsonString) {
		try {
			JSONObject jsonObject = JSONObject.fromObject(jsonString);
			return jsonObject;
		} catch (JSONException je)  {
			logger.fatal("Convert to JSON object Error : \n" + jsonString);
			je.printStackTrace();
			return null;
		}
	}

	/**
	 * Convert a json string to an JSONArray and return null if there is some json exception occur
	 * */
	public static JSONArray convertString2JSONArray(String jsonString) {
		try {
			JSONArray jsonArray = JSONArray.fromObject(jsonString);
			return jsonArray;
		} catch (JSONException je)  {
			logger.fatal("Convert to JSON array Error : \n" + jsonString);
			je.printStackTrace();
			return null;
		}
	}

}
