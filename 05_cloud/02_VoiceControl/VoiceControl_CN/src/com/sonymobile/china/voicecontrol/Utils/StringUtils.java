package com.sonymobile.china.voicecontrol.Utils;

import java.util.ArrayList;

import android.util.Log;

public class StringUtils {
	private static final String TAG = "StringUtils";

	/**
	 * 在ArrayList<String>里搜索特定串
	 * @param list
	 * 			列表
	 * @param item
	 * 			子串
	 * @return
	 * 			true: 找到
	 * 			false: 未找�?
	 */
	public static boolean searchList(ArrayList list, String subStr){
		if(list == null || list.size() < 1 || subStr == null){
			return false;
		}
		
		for(int i = 0; i < list.size(); i++){
			if(subStr.equals(list.get(i))){
				return true;
			}
		}
		
		return false;
	}
	
	/**
	 * 判断子串是否包含在数组中
	 * @param subString
	 * 			待查找串
	 * @param array
	 * 			字符串数�?
	 * @return
	 * 			true: 找到
	 * 			false: 未找�?
	 */
	public static boolean searchArray(String subString, String[] array){
		if(subString == null || array == null)
			return false;
		for(int i = 0; i < array.length; i++){
			if(subString.equals(array[i]))
				return true;
		}
		return false;
	}
	
	public static boolean searchArray(String subString, String[][] array){
		if(subString == null || array == null)
			return false;
		Log.d(TAG, "+++ array length: " + array.length);
		for(int i = 0; i < array.length; i++){
//			Logs.d("+++ " + subString + " vs " + array[i][0]);
			if(subString.equals(array[i][0]))
				return true;
		}
		return false;
	}
}
