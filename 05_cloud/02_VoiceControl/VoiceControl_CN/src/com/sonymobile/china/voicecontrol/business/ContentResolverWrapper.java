package com.sonymobile.china.voicecontrol.business;

import android.content.ContentResolver;
import android.content.Context;

public abstract class ContentResolverWrapper {
	
	protected ContentResolver mContentResolver;
	
	public void init(Context context) {
		Context ctx = context.getApplicationContext();
		mContentResolver = ctx.getContentResolver();
	}
}
