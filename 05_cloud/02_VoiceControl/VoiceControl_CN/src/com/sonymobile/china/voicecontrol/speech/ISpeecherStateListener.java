package com.sonymobile.china.voicecontrol.speech;

public interface ISpeecherStateListener {

	public void onRecognizeStart();

	public void onRecognizeEnd();

	public void onSpeakStart();

	public void onSpeakEnd();
	
	public void onError();

	public void onRelease();

}
