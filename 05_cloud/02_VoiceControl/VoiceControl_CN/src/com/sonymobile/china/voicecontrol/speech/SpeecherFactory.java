package com.sonymobile.china.voicecontrol.speech;

public final class SpeecherFactory {

	public static ISpeecher createSpeecher(SpeecherVendors vendor, ISpeecherStateListener listener) {
		ISpeecher speecher = null;
		switch (vendor) {
		// TODO : Add specify vendor 
		case AISPEECH:
			speecher = null;
			break;
		case IFLYTEK:
			break;
		default:
			break;
		
		}
		if (speecher != null) {
			speecher.setSpeecherStateListener(listener);
		}
		return speecher;
	}

}
