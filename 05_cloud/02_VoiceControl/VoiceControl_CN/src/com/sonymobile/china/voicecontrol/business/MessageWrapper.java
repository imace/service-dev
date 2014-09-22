package com.sonymobile.china.voicecontrol.business;

import com.sonymobile.china.voicecontrol.Utils.Util;

import android.content.ContentValues;
import android.database.Cursor;
import android.provider.Telephony;

public final class MessageWrapper extends ContentResolverWrapper {
	
	private static MessageWrapper mInstance;

	public static final String[] SMS_INBOX_PROJECTIONS = { 
		Telephony.Sms.Inbox._ID,     //0
		Telephony.Sms.Inbox.ADDRESS, //1
		Telephony.Sms.Inbox.PERSON,  //2
		Telephony.Sms.Inbox.BODY,    //3
		Telephony.Sms.Inbox.DATE     //4
	};
	
	public static final int PROJECTION_ID_INDEX = 0;
	public static final int PROJECTION_ADDRESS_INDEX = 1;
	public static final int PROJECTION_PERSON_INDEX = 2;
	public static final int PROJECTION_BODY_INDEX = 3;
	public static final int PROJECTION_DATE_INDEX = 4;

	private static final String QUERY_SELECTION = Telephony.Sms.Inbox.TYPE + " = ? and " + Telephony.Sms.Inbox.READ + " = ?";
	private static final String[] QUERY_SELECTION_ARGS = { 
		String.valueOf(Telephony.Sms.Inbox.MESSAGE_TYPE_INBOX),
		String.valueOf(false)
	};
	
	// The message updated to readed selection
	private static final String UPDATE_SELECTION = Telephony.Sms.Inbox._ID + " = ?";

	private MessageWrapper() {

	}

	public static MessageWrapper getInstance() {
		synchronized(MessageWrapper.class) {
			if (mInstance == null) {
				mInstance = new MessageWrapper();
			}
		}

		return mInstance;
	}
	
	public Cursor getUnreadMessagesCursor() {
		Cursor cur = mContentResolver
				.query(Telephony.Sms.Inbox.CONTENT_URI, SMS_INBOX_PROJECTIONS, QUERY_SELECTION,
						QUERY_SELECTION_ARGS, Telephony.Sms.Inbox.DEFAULT_SORT_ORDER);
		return cur;
	}
	
	public int getUnreadMessagesCount() {
		Cursor cur = getUnreadMessagesCursor();
		int count = cur.getCount();
		cur.close();
		return count;
	}
	
	public String getLatestUnreadMessage(Cursor cur) {
		long date;
		StringBuffer sb = new StringBuffer();
		String phoneNum = null, name = null, body = null, dateStr = null;
		if (cur.getCount() > 0) {
			if (cur.moveToFirst()) {
				phoneNum = cur.getString(PROJECTION_ADDRESS_INDEX);
				name = cur.getString(PROJECTION_PERSON_INDEX);
				body = cur.getString(PROJECTION_BODY_INDEX);
				date = cur.getLong(PROJECTION_DATE_INDEX);
				dateStr = Util.transFullTimeTTS(date);
			}
			if (name == null || name.isEmpty()) {
				name = phoneNum;
			}
			sb.append(name);
			sb.append('于');
			sb.append(dateStr);
			sb.append("发送了一条短信，短信内容是");
			sb.append(body);
		} else {
			sb.append("您暂时没有未读短信!");
		}

		return sb.toString();
	}
	
	public int getLatestUnreadMessageId() {
		int id = -1;
		Cursor cur = getUnreadMessagesCursor();
		if (cur.getCount() > 0 && cur.moveToFirst()) {
			id = cur.getInt(PROJECTION_ID_INDEX); 
		}
		cur.close();
		return id;
	}
	
	public boolean setMessageAsReaded(int messageId) {
		ContentValues values = new ContentValues();
		values.put(Telephony.Sms.Inbox.READ, true);
		String[] update_projection_args = {String.valueOf(messageId) };
		int rowNum = mContentResolver.update(Telephony.Sms.Inbox.CONTENT_URI,
				values, UPDATE_SELECTION,
				update_projection_args);
		return rowNum == 1;
	}

}
