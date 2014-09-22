package com.sonymobile.china.voicecontrol.business;

import android.content.Context;
import android.content.Intent;
import android.provider.AlarmClock;

public final class ClockOperator {
	public static final int ONE_HOUR_TO_SECONDS = 1 * 60 * 60;
	public static final int ONE_MINIUTE_TO_SECONDS = 1 * 60;

	public static void setAlarm(Context context, int hour, int miniute) {
		Intent intent = new Intent(AlarmClock.ACTION_SET_ALARM);
		intent.putExtra(AlarmClock.EXTRA_HOUR, hour);
		intent.putExtra(AlarmClock.EXTRA_MINUTES, miniute);
		intent.putExtra(AlarmClock.EXTRA_SKIP_UI, true);
		
		intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		context.startActivity(intent);
	}

	public static void setTimer(Context context, int hours, int miniutes,
			int seconds, String message) {
		int tagetSeconds = hours * ONE_HOUR_TO_SECONDS + miniutes * ONE_HOUR_TO_SECONDS + seconds;
		setTimer(context, tagetSeconds, message);
	}

	public static void setTimer(Context context, long seconds, String message) {
		Intent intent = new Intent(AlarmClock.ACTION_SET_TIMER);
		intent.putExtra(AlarmClock.EXTRA_LENGTH, seconds);
		intent.putExtra(AlarmClock.EXTRA_SKIP_UI, true);
		intent.putExtra(AlarmClock.EXTRA_MESSAGE, message);
		
		intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		context.startActivity(intent);
	}

}
