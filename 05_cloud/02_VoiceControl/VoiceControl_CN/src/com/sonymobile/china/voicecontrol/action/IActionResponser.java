package com.sonymobile.china.voicecontrol.action;

public interface IActionResponser {
	public void onResponse(String text);

	public void onResponse(int drawbleId);
	
	public void onResponse(String text, int drawableId);
	
	public void onAcitonDone();

}