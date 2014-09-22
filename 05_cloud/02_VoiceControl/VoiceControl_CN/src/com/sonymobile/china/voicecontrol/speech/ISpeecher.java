package com.sonymobile.china.voicecontrol.speech;

public interface ISpeecher {

	public void init();
	
	public void startRecognize();
	
	public boolean setSpeecherStateListener(ISpeecherStateListener listener);
	
	public void playTTS(String text);
	
	public void stopPlayingTTS();

	public boolean reset();
}
