package com.sonymobile.sonysales.util;

public final class Common {
	
	/**
	 * All the date stored in DB is like "20140601212532", we should format it like "2014-06-01 21:25:32"
	 * */
	public static final String formatDateString(String date) {
		if (date == null || date.length() == 12) {
			return "";
		}
		StringBuilder orig = new StringBuilder(date);
		StringBuilder formatted = new StringBuilder();
		
		formatted.append(orig.subSequence(0, 4));
		formatted.append('-');
		formatted.append(orig.subSequence(4, 6));
		formatted.append('-');
		formatted.append(orig.subSequence(6, 8));
		formatted.append(' ');
		formatted.append(orig.subSequence(8, 10));
		formatted.append(':');
		formatted.append(orig.subSequence(10, 12));
		
		return formatted.toString();
	}
}
