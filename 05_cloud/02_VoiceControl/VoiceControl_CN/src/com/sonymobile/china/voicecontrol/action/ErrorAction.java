package com.sonymobile.china.voicecontrol.action;

import android.content.Context;

import com.sonymobile.china.voicecontrol.Utils.Constant;

public class ErrorAction extends VoiceBaseAction {

	public ErrorAction(IActionResponser actionResponser, Context context) {
		super(actionResponser, context);
	}

	@Override
	public void onDo() {
		// TODO : ERROR action tip message
		String text = "识别出错！";
		onResponse(text, Constant.EMPTY_DRAWABLE_RESOURCE_ID);
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

}
