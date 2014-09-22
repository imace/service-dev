package com.sonymobile.china.voicecontrol;

import android.app.Service;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;

import com.sonymobile.china.voicecontrol.action.ActionManager;
import com.sonymobile.china.voicecontrol.speech.ISpeecherStateListener;
import com.sonymobile.china.voicecontrol.speech.SpeecherSingleton;

public class VoiceService extends Service implements ISpeaker, ISpeecherStateListener, IDeviceDisplayer{

	private SpeecherSingleton mSpeecherInstance;
	private ActionManager mActionManager = new ActionManager(this, this, this);

	@Override
	public IBinder onBind(Intent intent) {
		return null;
	}

	@Override
	public void speakText(String text) {
		mSpeecherInstance.playTTS(text);
	}

	@Override
	public void stopSpeaking() {
		mSpeecherInstance.stopPlayTTS();		
	}

	@Override
	public void onCreate() {
		
	}
	
	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		
		return super.onStartCommand(intent, flags, startId);
	}
	
	private void handleAction(int action, Bundle bundle) {
		Handler handler = mActionManager.getActionHandler();
		Message msg = Message.obtain(handler, action, bundle);
		handler.sendMessage(msg);
	}

	@Override
	public void onRecognizeEnd() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onRecognizeStart() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onSpeakStart() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onSpeakEnd() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onError() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onRelease() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateDeviceDrawable(Drawable icon) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateDeviceText() {
		// TODO Auto-generated method stub
		
	}


}
