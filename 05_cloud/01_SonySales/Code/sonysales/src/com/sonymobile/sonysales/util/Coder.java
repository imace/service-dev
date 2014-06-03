package com.sonymobile.sonysales.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public final class Coder {

	private static final String OAUTH_STATE_TOO_LONG = "The state used to OAuth is longer than 128 byes.";

	public static String generateJSONOAuthStateWithUrl(String redirectUrl,
			Map<String, String> parameters) {
		JSONObject jo = new JSONObject();
		jo.put("redirectUrl", redirectUrl);
		JSONArray ja = JSONArray.fromObject(parameters);
		jo.put("para", ja);
		return Base64Coder.convertStrToBase64(jo.toString());
	}

	public static String generateOAuthStateFromUrl(String redirectUrl,
			Map<String, String> parameters) {
		StringBuilder sb = new StringBuilder(redirectUrl);
		if (parameters != null && !parameters.isEmpty()) {
			sb.append('?');
			Iterator<Entry<String, String>> iterator = parameters.entrySet()
					.iterator();
			while (iterator.hasNext()) {
				Entry<String, String> para = iterator.next();
				sb.append(para.getKey());
				sb.append('=');
				sb.append(para.getValue());
				if (iterator.hasNext()) {
					sb.append('&');
				}
			}
		}

		// try {
		// return URLEncoder.encode(sb.toString(), "utf-8");
		// } catch (UnsupportedEncodingException e) {
		// e.printStackTrace();
		// return null;
		// }
		String codedUrl = Base62Coder.convertStrToBase62(sb.toString());
		if (codedUrl.length() > 128) {
			throw new OutOfLimitedLengthException(OAUTH_STATE_TOO_LONG);
		}
		return codedUrl;
		// return Base32Coder.convertStrToBase32(sb.toString());
		// return Base64Coder.convertStrToBase64(sb.toString());
	}

	public static String decodeOAuthStateToUrl(String codedState) {
		// try {
		// return URLDecoder.decode(codedState, "utf-8");
		// } catch (UnsupportedEncodingException e) {
		// e.printStackTrace();
		// return null;
		// }
		return Base62Coder.convertBase62ToStr(codedState);
		// return Base32Coder.convertBase32ToStr(codedState);
		// return Base64Coder.convertBase64ToStr(codedState);
	}

	public static String getMD5Signature(String... strings) {
		String orign = "";
		for (String str : strings) {
			orign += str;
		}
		System.out.println(orign);
		return GetMD5Code(orign);
	}

	public static String GetMD5Code(String strObj) {
		String resultString = null;
		try {
			resultString = new String(strObj);
			MessageDigest md = MessageDigest.getInstance("MD5");
			resultString = byteToString(md.digest(strObj.getBytes("utf-8")));
		} catch (NoSuchAlgorithmException ex) {
			ex.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return resultString;
	}

	private static String byteToString(byte[] bByte) {
		StringBuffer sBuffer = new StringBuffer();
		for (int i = 0; i < bByte.length; i++) {
			sBuffer.append(byteToArrayString(bByte[i]));
		}
		return sBuffer.toString();
	}

	private static String byteToArrayString(byte bByte) {
		int iRet = bByte;
		// System.out.println("iRet="+iRet);
		if (iRet < 0) {
			iRet += 256;
		}
		int iD1 = iRet / 16;
		int iD2 = iRet % 16;
		return strDigits[iD1] + strDigits[iD2];
	}

	private final static String[] strDigits = { "0", "1", "2", "3", "4", "5",
			"6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

	public static void main(String[] args) {
		String url = "http://sonysales.sinaapp.com/relation";
		Map<String, String> map = new Hashtable<String, String>();
		map.put("fromId", "394810239400-4850239458");
		map.put("fromName", "adf;adalruqoweiruoqe");
		// String base64 = generateJSONOAuthStateWithUrl(url, map);
		// System.out.println("json - base64 = " + base64);
		// System.out.println("jsonStr = " +
		// Base64Coder.convertBase64ToStr(base64));

		String base65 = generateOAuthStateFromUrl(url, map);
		System.out.println("url -base64 = " + base65);
		System.out.println("url = " + decodeOAuthStateToUrl(base65));

		String base62 = "aHR0cDovL3NvbnlzYWxlcy5zaW5hYXBwLmNvbS9yZWxhdGlvbnBhZ2UicZnJvbWlkPW92OUpxdUc0cW1xZGg3elgwWThreUc1Tl9fNk0maWRlbnRpZmllcj1zb255c2F";// Base62Coder.convertStrToBase62(url);

		System.out.println("url -base64 = " + base62);
		System.out.println("url  = " + Base62Coder.convertBase62ToStr(base62));
	}
}
