package com.sonymobile.china.voicecontrol.speech;

import android.os.Bundle;

interface IActionReporter {
	
	public int getCurrentAction();
	
	public Bundle getActionArgs();
	
}
