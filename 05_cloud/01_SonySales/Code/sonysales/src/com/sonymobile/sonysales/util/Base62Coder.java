package com.sonymobile.sonysales.util;

import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;

public final class Base62Coder {
	private static char[] encodes = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
			.toCharArray();
	private static byte[] decodes = new byte[256];
	
	static {  
	    for (int i = 0; i < encodes.length; i++) {  
	        decodes[encodes[i]] = (byte) i;  
	    }  
	}  
	public static String convertStrToBase62(final String origStr) {
		try {
			byte[] data = origStr.getBytes("utf-8");
			StringBuilder sb = new StringBuilder(data.length * 2);
			int pos = 0, val = 0;
			for (int i = 0; i < data.length; i++) {
				val = (val << 8) | (data[i] & 0xFF);
				pos += 8;
				while (pos > 5) {
					char c = encodes[val >> (pos -= 6)];
					sb.append(
					/**/c == 'i' ? "ia" :
					/**/c == '+' ? "ib" :
					/**/c == '/' ? "ic" : c);
					val &= ((1 << pos) - 1);
				}
			}
			if (pos > 0) {
				char c = encodes[val << (6 - pos)];
				sb.append(
				/**/c == 'i' ? "ia" :
				/**/c == '+' ? "ib" :
				/**/c == '/' ? "ic" : c);
			}
			return sb.toString();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String convertBase62ToStr(final String encoded)
			throws IllegalArgumentException {
		try {
			final char[] data = encoded.toCharArray(); // avoids using charAt()
			ByteArrayOutputStream baos = new ByteArrayOutputStream(data.length);
			int pos = 0, val = 0;
			for (int i = 0; i < data.length; i++) {
				char c = data[i];
				if (c == 'i') {
					c = data[++i];
					c =
					/**/c == 'a' ? 'i' :
					/**/c == 'b' ? '+' :
					/**/c == 'c' ? '/' : data[--i];
				}
				val = (val << 6) | decodes[c];
				pos += 6;
				while (pos > 7) {
					baos.write(val >> (pos -= 8));
					val &= ((1 << pos) - 1);
				}
			}
			byte[] chars = baos.toByteArray();
			return new String(chars, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
}
