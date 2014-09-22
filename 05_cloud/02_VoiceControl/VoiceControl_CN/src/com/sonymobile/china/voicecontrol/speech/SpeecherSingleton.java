package com.sonymobile.china.voicecontrol.speech;

public final class SpeecherSingleton {
	private SpeecherSingleton mInstance;
	
	private ISpeecher mSpeecher;
	
	private SpeecherSingleton() {
		
	}
	
	public synchronized SpeecherSingleton getInstance() {
		if (mInstance == null) {
			mInstance = new SpeecherSingleton();
		}
		return mInstance;
	}
	
	public void init(SpeecherVendors vendor, ISpeecherStateListener listener) {
		if (mSpeecher == null) {
			mSpeecher = SpeecherFactory.createSpeecher(vendor, listener);
		}
	}
	 
	public void playTTS(String text) {
		
	}
	
	public void stopPlayTTS() {
		
	}
	
	public void startTalk() {
		
	}

}
