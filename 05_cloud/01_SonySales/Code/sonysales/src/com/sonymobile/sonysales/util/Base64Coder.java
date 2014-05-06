package com.sonymobile.sonysales.util;

import java.io.UnsupportedEncodingException;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * The util of encoded or decoded between base64 to normal utf-8 string 
 * */
public final class Base64Coder {

	/**
	 * Convert normal String to Base64 encoded string
	 * 
	 * @param str normal String
	 * 
	 * @return encoded String; it will be null if the string cannot change to utf-8
	 * */
	public static String convertStrToBase64(String str) {
		byte[] b = null;
		String s = null;
		try {
			b = str.getBytes("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if (b != null) {
			s = new BASE64Encoder().encode(b);
		}
		return s;
	}

	/**
	 * Convert Base64 encoded string to normal String
	 * 
	 * @param str encoded String
	 * 
	 * @return normal utf-8 String
	 * */
	public static String convertBase64ToStr(String s) {
		byte[] b = null;
		String result = null;
		if (s != null) {
			BASE64Decoder decoder = new BASE64Decoder();
			try {
				b = decoder.decodeBuffer(s);
				result = new String(b, "utf-8");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
