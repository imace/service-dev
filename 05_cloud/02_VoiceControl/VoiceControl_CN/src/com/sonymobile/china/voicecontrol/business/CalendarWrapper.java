package com.sonymobile.china.voicecontrol.business;

import java.util.Calendar;

import com.sonymobile.china.voicecontrol.Utils.Util;

import android.content.ContentUris;
import android.database.Cursor;
import android.net.Uri;
import android.provider.CalendarContract.Instances;

public final class CalendarWrapper extends ContentResolverWrapper{
	private static CalendarWrapper mInstance;
	
	public static final String[] CALENDAR_PROJECTION = new String[] {
	    Instances.EVENT_ID,      // 0
	    Instances.BEGIN,         // 1
	    Instances.END,           // 2
	    Instances.TITLE,          // 3
	    Instances.EVENT_LOCATION  // 4
	  };
	  
	// The indices for the projection array above.
	private static final int PROJECTION_ID_INDEX = 0;
	private static final int PROJECTION_BEGIN_INDEX = 1;
	private static final int PROJECTION_END_INDEX = 2;
	private static final int PROJECTION_TITLE_INDEX = 3;
	private static final int PROJECTION_LOCATION_INDEX = 4;

	private CalendarWrapper() {
		
	}
	
	public static CalendarWrapper getInstance() {
		synchronized(CalendarWrapper.class) {
			if (mInstance == null) {
				mInstance = new CalendarWrapper();
			}
		}
		return mInstance;
	}
	
	public String getLatestEvent() {
		StringBuffer eventSb = new StringBuffer();
		Uri.Builder builder = Instances.CONTENT_URI.buildUpon();
		ContentUris.appendId(builder, System.currentTimeMillis());
		ContentUris.appendId(builder, Long.MAX_VALUE);
		String order = Instances.BEGIN + " asc";
		Cursor calendarCursor = mContentResolver.query(builder.build(), CALENDAR_PROJECTION, null, null, order);
		if (calendarCursor.getCount() > 0) {
			if (calendarCursor.moveToFirst()) {
				eventSb = getContentFromCursor(calendarCursor);
			}
		} else {
			eventSb.append("暂无任何安排");
		}
			
		calendarCursor.close();
		return eventSb.toString();
	}
	
	public String getDurationEvents(Calendar beginTime, Calendar endTime) {
		String eventString = "";
		long startMillis = beginTime.getTimeInMillis();
		long endMillis = endTime.getTimeInMillis();

		Uri.Builder builder = Instances.CONTENT_URI.buildUpon();
		ContentUris.appendId(builder, startMillis);
		ContentUris.appendId(builder, endMillis);

		Cursor cur =  mContentResolver.query(builder.build(), CALENDAR_PROJECTION, null, null, null);
		if (cur.getCount() > 0) {
			eventString = buildCalendarEventString(cur);
		} else {
			eventString = "在此期间暂无安排";
		}
		cur.close();

		return eventString;
	}
	
	private String buildCalendarEventString(Cursor calendarCursor) {
		StringBuffer eventSb = new StringBuffer();
		int count = calendarCursor.getCount();
		if (count > 0) {
			eventSb.append("您有").append(count).append("个会议提醒，他们分别是");
			calendarCursor.moveToFirst();
			do {
				eventSb.append(getContentFromCursor(calendarCursor));
			} while (calendarCursor.moveToNext());
		} else {
			eventSb.append("您暂没有会议提醒");
		}
		
		return eventSb.toString();
	}
	
	private StringBuffer getContentFromCursor(Cursor cursor) {
		StringBuffer eventSb = new StringBuffer();
		String eventId, title, location;
		long startTime, endTime;
		
		eventId = cursor.getString(PROJECTION_ID_INDEX);
		title = cursor.getString(PROJECTION_TITLE_INDEX);
		startTime = cursor.getLong(PROJECTION_BEGIN_INDEX);
		endTime = cursor.getLong(PROJECTION_END_INDEX);
		location = cursor.getString(PROJECTION_LOCATION_INDEX);
	    
		String startStr = Util.transFullTimeTTS(startTime);
		String endStr = Util.transFullTimeTTS(endTime);
		
		if(location != null && !location.isEmpty()) {
			location = "在" + location;
		}
		eventSb.append(startStr).append("到").append(endStr).append(location).append("参加").append(title).append("");
		return eventSb;
	}

	private void debugCursorContents(Cursor cursor) {
		String[] columns = cursor.getColumnNames();
		for (String c : columns) {
			int columnIndex = cursor.getColumnIndex(c);
			System.out.println("~~~~~~~~~~~~~~~~~~~"+c+" = "+cursor.getString(columnIndex)+"~~~~~~~~~~~~~~~~~");
		}
	}
}
