package com.sonymobile.china.voicecontrol.action;

import android.content.Context;


public class PhoneAction extends VoiceBaseAction {
	private String mContactName = null;
	private String mPhoneNum = null;
	private boolean isMultiContactName = false;
	private boolean isMultiPhoneNum = false;
	
	public PhoneAction(IActionResponser actionResponser, Context context) {
		super(actionResponser, context);
	}

	@Override
	public void onDo() {
		if (mPhoneNum != null && !mPhoneNum.isEmpty()) {
			// TODO : speak
		} else if (mContactName != null && !mContactName.isEmpty()){
			// TODO : speak confirm call action
		}
	}
	
	public void setContactName(String contactName) {
		mContactName = contactName;
	}
	
	public void setPhoneNum(String num) {
		mPhoneNum = num;
	}
	

	private void makePhoneCall() {
		
	}

	@Override
	public int getActionType() {
		return VoiceControlActions.ACTION_CALL;
	}

	@Override
	public void onConfirm() {
		makePhoneCall();
	}

	@Override
	public void onCancel() {
		
		
	}

	@Override
	public void onSelect(int index) {
		
	}
	
	private String[] getPhoneNums() {
		return null;
	}

}
