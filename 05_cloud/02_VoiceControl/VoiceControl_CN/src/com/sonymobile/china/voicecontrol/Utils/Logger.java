package com.sonymobile.china.voicecontrol.Utils;

import android.os.SystemClock;
import android.util.Log;

public final class Logger {

	private final static String TAG_PREFIX = Constant.Debug_TAG;
	private static boolean mIsLogEnable = Constant.IS_ENABLE_DEBUG;
	private static long mLogtime = 0;
	
	public void setLogEnable(boolean enable){
		mIsLogEnable = enable;
	}
	
	public static void i(String log){
		if (mIsLogEnable)
			Log.i(TAG_PREFIX, log);
	}
	
	public static void d(String log){
		if (mIsLogEnable)
			Log.d(TAG_PREFIX, log);
	}
	
	public static void e(String log){
		if (mIsLogEnable)
			Log.e(TAG_PREFIX, log);
	}
	
	public static void i(String tag, String log){
		if (mIsLogEnable)
			Log.i(TAG_PREFIX + " - " + tag, log);
	}
	
	public static void d(String tag, String log){
		if (mIsLogEnable)
			Log.d(TAG_PREFIX + " - " + tag, log);
	}
	
	public static void w(String tag, String log){
		if (mIsLogEnable){
			Log.w(TAG_PREFIX + " - " + tag, log);
		}
	}
	
	public static void e(String tag, String log){
		if (mIsLogEnable)
			Log.e(TAG_PREFIX + " - " + tag, log);
	}
	
	public static void resetTime(){
		mLogtime = SystemClock.elapsedRealtime();
	}
	
	private static String addTimeMsg(String msg) {
        return " Time :" + (SystemClock.elapsedRealtime() - mLogtime + " -> " + msg);
    }
	
	public static void time_i(String tag,String msg){
		if (mIsLogEnable)
			Log.i(tag, addTimeMsg(msg));
	}
	
	public static void time_d(String tag,String msg){
		if (mIsLogEnable)
			Log.d(tag, addTimeMsg(msg));
	}

	public static void time_w(String tag,String msg){
		if (mIsLogEnable)
			Log.w(tag, addTimeMsg(msg));
	}
	
	public static void time_v(String tag,String msg){
		if (mIsLogEnable)
			Log.v(tag, addTimeMsg(msg));
	}
	
	public static void time_e(String tag,String msg){
		if (mIsLogEnable)
			Log.e(tag, addTimeMsg(msg));
	}

}