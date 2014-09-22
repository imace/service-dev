package com.sonymobile.china.voicecontrol.action;

import com.sonymobile.china.voicecontrol.business.ClockOperator;

import android.content.Context;

public class TimerAction extends VoiceBaseAction {
	private long timeLength;
	
	private String mMessage;

	public TimerAction(IActionResponser actionResponser, Context context) {
		super(actionResponser, context);
	}

	@Override
	public void onDo() {
		ClockOperator.setTimer(mContext, timeLength, mMessage);
	}

	@Override
	public int getActionType() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void onConfirm() {
		// TODO Auto-generated method stub

	}

	@Override
	public void onCancel() {
		// TODO Auto-generated method stub

	}

	@Override
	public void onSelect(int index) {
		// TODO Auto-generated method stub

	}
	
	public void setTimerLength(long seconds) {
		timeLength = seconds;
	}
	
}
