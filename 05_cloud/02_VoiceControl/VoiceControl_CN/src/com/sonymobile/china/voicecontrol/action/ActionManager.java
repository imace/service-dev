package com.sonymobile.china.voicecontrol.action;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Message;

import com.sonymobile.china.voicecontrol.IDeviceDisplayer;
import com.sonymobile.china.voicecontrol.ISpeaker;
import com.sonymobile.china.voicecontrol.Utils.Constant;

public class ActionManager implements IActionResponser {
	
	private ISpeaker mVoiceManager;
	
	private IDeviceDisplayer mA3Displayer;
	
	private Context mContext;

	private VoiceBaseAction mAction = null;

	private Handler mActionHandler = new Handler() {
		@Override
		public void handleMessage(Message msg) {
			int action = msg.what;
			switch(action) {
			case VoiceControlActions.ACTION_CALL:
				String phoneNum = (String)msg.obj;
				mAction = new PhoneAction(ActionManager.this, mContext);
				((PhoneAction)mAction).setPhoneNum(phoneNum);
				break;
			case VoiceControlActions.ACTION_GET_DATE:
				
				break;
			case VoiceControlActions.ACTION_GET_TIME:
				if (mAction != null) {
					mAction.onCancel();
				}
				break;
			case VoiceControlActions.ACTION_CONFIRMED:
				if (mAction != null) {
					mAction.onConfirm();
				}
				return;
			case VoiceControlActions.ACTION_CANCEL:
				if (mAction != null) {
					mAction.onCancel();
				}
				return;
			case VoiceControlActions.ACTION_SELECT:
				if (mAction != null) {
					int index = (Integer)msg.obj;
					mAction.onSelect(index);
				}
				return;
			case VoiceControlActions.ACTION_DONE:
				clearActionManager();
				return;
			case VoiceControlActions.ACTION_RESET:
				resetActionManager();
				return;
				default:
					
			}
			
			if (mAction != null) {
				mAction.onDo();
			}
		}
	};

	public ActionManager(Context context, ISpeaker vm, IDeviceDisplayer dis) {
	    this.mContext = context;
		this.mVoiceManager = vm;
		this.mA3Displayer = dis;
	}

	public Handler getActionHandler() {
		return mActionHandler;
	}

	private void clearActionManager() {
		mAction = null;
		
	}

	private void resetActionManager() {
		clearActionManager();
	}

	@Override
	public void onResponse(String text, int drawableId) {
		if (text != null && !text.isEmpty()) {
			SpeakText(text);
		}
		if (drawableId != Constant.EMPTY_DRAWABLE_RESOURCE_ID) {
			Drawable icon = mContext.getResources().getDrawable(drawableId);
			updateImageToDevice(icon);
		}
	}

	@Override
	public void onResponse(String text) {
		if (text != null && !text.isEmpty()) {
			SpeakText(text);
		}
	}

	@Override
	public void onResponse(int drawableId) {
		if (drawableId != Constant.EMPTY_DRAWABLE_RESOURCE_ID) {
			Drawable icon = mContext.getResources().getDrawable(drawableId);
			updateImageToDevice(icon);
		}
		
	}

	@Override
	public void onAcitonDone() {
		clearActionManager();
	}
	
	/**
	 * 
	 * */
	private void SpeakText(String text) {
		if (mVoiceManager != null) {
			mVoiceManager.speakText(text);
		}
	}
	
	private void updateImageToDevice(Drawable icon) {
		if (icon != null) {
			mA3Displayer.updateDeviceDrawable(icon);
		}
	}

}
