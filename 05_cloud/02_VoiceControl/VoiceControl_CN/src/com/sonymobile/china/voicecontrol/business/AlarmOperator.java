package com.sonymobile.china.voicecontrol.business;

import android.app.AlarmManager;
import android.content.Context;

public class AlarmOperator {
	private AlarmManager mAlarmMgr;
	
	public static final long MILLIS_IN_HOUR = 1*60*60*1000;
	public static final long MILLIS_IN_MINIUTES = 1*60*1000;
	
	public AlarmOperator(Context context) {
		mAlarmMgr = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
	}
	
	public boolean setAlarm(long timeInMillis) {
		boolean isSetDone = false;
		if (timeInMillis > 0 ) {
			try {
				mAlarmMgr.set(AlarmManager.RTC_WAKEUP, timeInMillis, null);
				isSetDone = true;
			} catch(Exception e) {
				e.printStackTrace();
				isSetDone = false;
			}
			
		}
		return isSetDone;
	}

	public boolean setAlarmAfterCurrentTime(int hours, int miniutes) {
		long timeInMillis = System.currentTimeMillis() + hours * MILLIS_IN_HOUR
				+ miniutes * MILLIS_IN_MINIUTES;
		return setAlarm(timeInMillis);
	}
	
}
