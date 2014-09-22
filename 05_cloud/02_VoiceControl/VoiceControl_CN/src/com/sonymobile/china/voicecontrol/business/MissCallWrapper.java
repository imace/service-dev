
package com.sonymobile.china.voicecontrol.business;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import android.annotation.SuppressLint;
import android.database.Cursor;
import android.net.Uri;
import android.provider.CallLog;
import android.provider.CallLog.Calls;

public class MissCallWrapper extends ContentResolverWrapper{

    private static MissCallWrapper mInstance;

    private List<CallLogBean> callLogs;

    private MissCallWrapper() {
    }

    public static MissCallWrapper getInstance() {
        synchronized (MissCallWrapper.class) {
            if (mInstance == null) {
                mInstance = new MissCallWrapper();
            }
        }
        return mInstance;
    }

    private int readMissCall() {
        int result = 0;
        Cursor cursor = mContentResolver.query(CallLog.Calls.CONTENT_URI, new String[] {
            Calls.TYPE
        }, " type=? and new=?", new String[] {
                Calls.MISSED_TYPE + "", "1"
        }, "date desc");

        if (cursor != null) {
            result = cursor.getCount();
            cursor.close();
        }
        return result;
    }

    @SuppressLint("SimpleDateFormat")
    public List<CallLogBean> GetMissCallList() {

        Uri uri = android.provider.CallLog.Calls.CONTENT_URI;
        String[] projection = {
                CallLog.Calls.DATE, CallLog.Calls.NUMBER, CallLog.Calls.TYPE,
                CallLog.Calls.CACHED_NAME, CallLog.Calls._ID,
        };
        String order = "date desc";
        Cursor cursor = mContentResolver.query(CallLog.Calls.CONTENT_URI, projection, null, null,
                order);

        if (cursor != null && cursor.getCount() > 0) {
            callLogs = new ArrayList<CallLogBean>();
            SimpleDateFormat sfd = new SimpleDateFormat("MM-dd hh:mm");
            Date date;
            cursor.moveToFirst();
            int misscall = readMissCall();
            for (int i = 0; i < misscall; i++) {
                cursor.moveToPosition(i);
                date = new Date(cursor.getLong(cursor.getColumnIndex(CallLog.Calls.DATE)));
                String number = cursor.getString(cursor.getColumnIndex(CallLog.Calls.NUMBER));
                int type = cursor.getInt(cursor.getColumnIndex(CallLog.Calls.TYPE));
                String cachedName = cursor.getString(cursor
                        .getColumnIndex(CallLog.Calls.CACHED_NAME));
                int id = cursor.getInt(cursor.getColumnIndex(CallLog.Calls._ID));

                CallLogBean callLogBean = new CallLogBean();
                callLogBean.setId(id);
                callLogBean.setNumber(number);
                callLogBean.setName(cachedName);
                if (null == cachedName || "".equals(cachedName)) {
                    callLogBean.setName(number);
                }
                callLogBean.setType(type);
                callLogBean.setDate(sfd.format(date));

                if (callLogBean.getType() == 3) {
                    callLogs.add(callLogBean);
                }
            }
        }
        return callLogs;
    }

    public String BuildSpeechString() {
        StringBuffer eventSb = new StringBuffer();
        List<CallLogBean> listCallLog = GetMissCallList();
        int calllogsize = 0;
        calllogsize = listCallLog.size();
        if (calllogsize == 0) {
            eventSb.append("您没有未接来电。");
        } else {
            eventSb.append("您有" + calllogsize + "个未接来电。");
            for (CallLogBean callLogBean : listCallLog) {
                eventSb.append(callLogBean.getName() + "号码为" + callLogBean.getNumber() + "于"
                        + callLogBean.getDate() + "拨打过您的电话。");
            }
        }
        return eventSb.toString();
    }
}
