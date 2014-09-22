package com.sonymobile.china.voicecontrol.action;

public interface VoiceControlActions {
	public static final int ACTION_UNKNOWN = Integer.MIN_VALUE;
	public static final int ACTION_CALL = 1;
	public static final int ACTION_GET_MISS_CALL = 2;
	public static final int ACTION_CALL_BACK = 3;
	public static final int ACTION_GET_TIME = 4;
	public static final int ACTION_GET_DATE = 5;
	public static final int ACTION_LOCAL_WEATHER = 6;
	public static final int ACTION_REMOTE_WEATHER = 7;
	public static final int ACTION_GET_NEW_MESSAGE_NUM = 8;
	public static final int ACTION_READ_MESSAGE = 9;
	
	public static final int ACTION_CONFIRMED = 100;
	public static final int ACTION_CANCEL = 101;
	public static final int ACTION_SELECT = 102;
	public static final int ACTION_DONE = 103;
	public static final int ACTION_RESET = 104;
}
