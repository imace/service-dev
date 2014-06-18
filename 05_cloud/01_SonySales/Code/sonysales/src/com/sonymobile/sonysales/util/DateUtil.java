package com.sonymobile.sonysales.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String getStrFromDate(SimpleDateFormat sdf, Date date) {
	    if(date==null) {
	        return "";
	    }
		return sdf.format(date);
	}
	
	public static Date getDateFromStr(SimpleDateFormat sdf, String date) {
		Date d = null;
		try {
			d = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return d;
	}	
	
	public static String toFormalDateStr(String createTime) {
	    
	    if(createTime!=null) {
        SimpleDateFormat dateformat1=new SimpleDateFormat("yyyyMMddHHmm");
        SimpleDateFormat dateformat2=new SimpleDateFormat("yyyy-MM-dd  HH:mm");
        String formalDate = getStrFromDate(dateformat2, getDateFromStr(dateformat1,createTime));
        return formalDate;
	    }
	    return "";
	    }
	
	public static boolean isEnd() {
		 Date currentDate = new Date();
    String currentDateStr = getStrFromDate(new SimpleDateFormat("yyyyMMdd"),currentDate);
    if(Constant.END_DATE!=null && currentDateStr.compareTo(Constant.END_DATE)>0) {
        return true;
    } else {
        return false;
           }
	}
	
}
