package com.sonymobile.china.voicecontrol.speech;

public final class SpeecherSingleton {
	private static SpeecherSingleton mInstance;
	
	private static final SpeecherVendors VENDOR = SpeecherVendors.IFLYTEK;
	
	private ISpeecher mSpeecher;
	
	private SpeecherSingleton() {
		
	}
	
	public static synchronized SpeecherSingleton getInstance() {
		if (mInstance == null) {
			mInstance = new SpeecherSingleton();
		}
		return mInstance;
	}
	
	public void init() {
		if (mSpeecher == null) {
			mSpeecher = SpeecherFactory.createSpeecher(VENDOR);
		}
	}
	
	public void setStateListener(ISpeecherStateListener listener) {
		mSpeecher.setSpeecherStateListener(listener);
	}
	 
	public void playTTS(String text) {
		
	}
	
	public void stopPlayTTS() {
		
	}
	
	public void startTalk() {
		
	}

}
