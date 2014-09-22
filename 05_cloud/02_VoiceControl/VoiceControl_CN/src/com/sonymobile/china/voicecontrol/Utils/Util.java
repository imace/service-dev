/**
 * Copyright (c) 2012-2012 Yunzhisheng(Shanghai) Co.Ltd. All right reserved.
 * @FileName : CalendarUtil.java
 * @ProjectName : iShuoShuo2
 * @PakageName : cn.yunzhisheng.vui.assistant.util
 * @Author : Brant
 * @CreateDate : 2012-11-21
 */
package com.sonymobile.china.voicecontrol.Utils;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import android.text.TextUtils;

public class Util {
	public static final String TAG = "CalendarUtil";
	
	public static final String TAP_CLICK_COUNT = "tab_click_count";
	
	public static String powerLevel;

	private static final double EARTH_RADIUS = 6378137.0;
	private static final double BASE_KB = 1024.00;
	private static final double BASE_MB = BASE_KB * 1024;
	private static final double BASE_GB = BASE_MB * 1024;
	private static final double BASE_KM = 1000.00;

	/**
	 * 求2个经纬度直接的距离
	 * @Description : gps2m
	 * @Author : Brant
	 * @CreateDate : 2013-3-15
	 * @param latA
	 * @param lngA
	 * @param latB
	 * @param lngB
	 * @return
	 */
	public static double gps2m(double latA, double lngA, double latB, double lngB) {
		double radLat1 = (latA * Math.PI / 180.0);
		double radLat2 = (latB * Math.PI / 180.0);
		double a = radLat1 - radLat2;
		double b = (lngA - lngB) * Math.PI / 180.0;
		double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) + Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(b / 2), 2)));
		s = s * EARTH_RADIUS;
		s = Math.round(s * 10000) / 10000;
		return s;
	}

	public static String trans2Length(double lengthInMeter) {
		if (lengthInMeter < BASE_KM) {
			return lengthInMeter + "m";
		} else {
			return new DecimalFormat("#.00").format(lengthInMeter / BASE_KM) + "Km";
		}
	}

	/**
	 * 将字节数转换成合适的单位
	 * @Description : trans2Unit
	 * @Author : Brant
	 * @CreateDate : 2013-3-15
	 * @param size
	 * @return
	 */
	public static String trans2Unit(long size) {
		String result = "";
		if (size > 0 && size < 1024) {
			result = size + "B";
		} else if (size >= 1024 && size < 1024 * 1024) {
			result = new DecimalFormat("#.00").format(size / BASE_KB) + "KB";
		} else if (size >= 1024 * 1024 && size < 1024 * 1024 * 1024) {
			result = new DecimalFormat("#.00").format(size / BASE_MB )+ "MB";
		} else if (size >= 1024 * 1024 * 1024) {
			result = new DecimalFormat("#.00").format(size / BASE_GB )+ "GB";
		}
		return result;
	}

	public static String getCurrentDate() {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int day = c.get(Calendar.DAY_OF_MONTH);
		int week = c.get(Calendar.DAY_OF_WEEK);
		String weekDay = week == 1 ? "天" : String.valueOf(week - 1);
		weekDay = transNumberTTS(weekDay);
		return year + "年" + month + "月" + day + "日" + ", 星期" + weekDay;
	}

	public static String getCurrentTime() {
		Calendar c = Calendar.getInstance();
		int hour = c.get(Calendar.HOUR);
		int minute = c.get(Calendar.MINUTE);
		int second = c.get(Calendar.SECOND);
		return hour + "点" + minute + "分" + second + "秒";
	}

	public static String getLeftPower() {
		return powerLevel+'%';
	}
	
	private static String transNumberTTS(String number) {
		if (TextUtils.isEmpty(number)) {
			return "";
		}
		String str1 = "0123456789";
		String str2 = "零一二三四五六七八九";
		
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < number.length(); i ++) {
			char c = number.charAt(i);
			int index = str1.indexOf(c);
			if (index >= 0) {
				sb.append(str2.charAt(index));
			}
		}
		return sb.toString();
	}
	
	public static String transDateTTS(String str) {
		if (TextUtils.isEmpty(str)) {
			return "";
		}

		String regEx="([0-9]+)-([0-9]+)-([0-9]+)";
		String year = "";
		Pattern p=Pattern.compile(regEx);
		Matcher m=p.matcher(str);
		if (m.find()) {
			int size = m.groupCount();
			if (size > 1) {
				year = m.group(1);
			}
		}
		str = str.replaceAll("([0-9]+)-([0-9]+)-([0-9]+)", transNumberTTS(year) + "年$2月$3日");
		return str;
	}
	
	public static String transFullTimeTTS(String str) {
		if (TextUtils.isEmpty(str)) {
			return "";
		}

		String regEx="([0-9]+)-([0-9]+)-([0-9]+) ([0-9]+):([0-9]+)";
		String year = "";
		Pattern p=Pattern.compile(regEx);
		Matcher m=p.matcher(str);
		if (m.find()) {
			int size = m.groupCount();
			if (size > 1) {
				year = m.group(1);
			}
		}
		str = str.replaceAll("([0-9]+)-([0-9]+)-([0-9]+) ([0-9]+):([0-9]+)", transNumberTTS(year) + "年$2月$3日$4点$5分");
		return str;
	}
	public static String transFullTimeTTS(long time) {
		if (time<0) {
			return "";
		}
		Calendar calendar = Calendar.getInstance();
	    calendar.setTimeInMillis(time);  
	    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	    String str = formatter.format(calendar.getTime());
	    
		return transFullTimeTTS(str);
	}
}
