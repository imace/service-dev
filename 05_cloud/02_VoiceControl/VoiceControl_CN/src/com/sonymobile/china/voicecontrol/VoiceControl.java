package com.sonymobile.china.voicecontrol;

import android.content.Context;
import android.os.Messenger;

import com.sonymobile.smartwear.swr30.Control;

public class VoiceControl extends Control {

	public VoiceControl(Context context, String controlInstanceId,
			Messenger messenger) {
		super(context, controlInstanceId, messenger);
	}

	@Override
	public void onStart() {
	}

	@Override
	public void onTap(final int event, final long timeStamp) {
	}

	@Override
	public void onStop() {
	}
}
