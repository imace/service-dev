package com.sonymobile.china.voicecontrol.action;

import android.content.Context;

public abstract class VoiceBaseAction {
	IActionResponser mActionResponser;
	protected Context mContext;
	public VoiceBaseAction(IActionResponser actionResponser, Context context) {
		mActionResponser = actionResponser;
		mContext = context;
	}
	
	/**
	 * 
	 * */
	public abstract void onDo();
	
	/**
	 * 
	 * */
	public abstract int getActionType();
	
	/**
	 * 
	 * */
	public abstract void onConfirm();

	/**
	 * 
	 * */
	public abstract void onCancel();
	
	/**
	 * 
	 * */
	public abstract void onSelect(int index);

	protected void onResponse(String text, int drawableId) {
		mActionResponser.onResponse(text, drawableId);
	}

	protected void onResponse(int drawableId) {
		mActionResponser.onResponse(drawableId);
	}

	protected void onResponse(String text) {
		mActionResponser.onResponse(text);
	}
	
	protected void onActionDone() {
		mActionResponser.onAcitonDone();
	}
}
