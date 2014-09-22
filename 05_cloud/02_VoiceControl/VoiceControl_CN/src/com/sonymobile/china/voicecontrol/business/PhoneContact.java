package com.sonymobile.china.voicecontrol.business;

import java.util.ArrayList;

import android.content.Context;
import android.database.Cursor;
import android.provider.ContactsContract;
import android.provider.ContactsContract.Contacts;
import android.provider.ContactsContract.RawContacts;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.widget.Toast;

import com.sonymobile.china.voicecontrol.Utils.Constant;
import com.sonymobile.china.voicecontrol.Utils.Logger;
import com.sonymobile.china.voicecontrol.Utils.StringUtils;


public class PhoneContact {
	private final static String TAG = Constant.Debug_TAG + " - PhoneContact";

	private static PhoneContact mIntance;
	private static Context mContext;

	private PhoneContact(Context context) {
		mContext = context;
	}

	public static PhoneContact getInstance(Context context) {
		if (mIntance == null) {
			mIntance = new PhoneContact(context);
		}
		return mIntance;
	}

	/**
	 * 通过姓名查询电话号码
	 * 
	 * @param name
	 * @return, 电话号码列表（一个联系人可能有多个号码）
	 */
	public static ArrayList<String> getNumsByName(Context context, String name) {
		if (name == null)
			return null;

		// 联系人ID
		int contactId = -1;
		// 联系人电话号码列表
		ArrayList<String> nums = new ArrayList<String>();

		// 选择需要读取的字段
		/** 读取联系人信息：姓名、是否有电话号码、ID */
		final String[] selectContact = {
				ContactsContract.Contacts.DISPLAY_NAME,
				ContactsContract.Contacts.HAS_PHONE_NUMBER,
				ContactsContract.Contacts._ID };
		final int COL_NAME = 0;
		final int COL_HAS_NUM = 1;
		final int COL_ID = 2;

		/** 读取联系人电话号码：电话号码 、号码类型 */
		final String[] selectNum = {
				ContactsContract.CommonDataKinds.Phone.NUMBER,
				ContactsContract.CommonDataKinds.Phone.TYPE };
		final int COL_NUM = 0;
		final int COL_TYPE = 1;

		Cursor cursor = null;
		Cursor phoneCursor = null;
		try {
			// 根据联系人姓名找到联系人ID
			/** 联系人查找条件：指定姓名 & 有电话号码 */
			String select = "((" + Contacts.DISPLAY_NAME + "=\"" + name
					+ "\") AND (" + Contacts.HAS_PHONE_NUMBER + "=1))";

			// 执行查询
			cursor = context.getContentResolver().query(
					ContactsContract.Contacts.CONTENT_URI,
					selectContact,
					select,
					null,
					ContactsContract.Contacts.DISPLAY_NAME
							+ " COLLATE LOCALIZED ASC");

			if (cursor == null) {
				// 异常，查询失败
				Toast.makeText(context,
						"Error: query contact returns null", Toast.LENGTH_LONG).show();
				return null;
			} else if (cursor.getCount() <= 0) {
				// 未找到指定联系人
				Toast.makeText(context, "Failed: no contact found. name: "
						+ name, Toast.LENGTH_LONG).show();
				if (cursor != null && !cursor.isClosed())
					cursor.close();
				return null;
			}
			Logger.d(TAG, "Contact count: " + cursor.getCount());

			// 根据联系人ID获取联系人电话号码
			if (cursor.moveToFirst()) {
				while (!cursor.isAfterLast()) {
					if ((cursor.getInt(COL_HAS_NUM)) == 1) {
						// 获取联系人ID
						contactId = cursor.getInt(COL_ID);
						Logger.d(TAG, "Contact ID: " + contactId);

						// 该联系人有电话号码
						/** 电话号码查找条件：指定联系人ID & 电话号码非空 */
						String numSelect = "(("
								+ ContactsContract.CommonDataKinds.Phone.CONTACT_ID
								+ "=" + contactId + ") AND ("
								+ ContactsContract.CommonDataKinds.Phone.NUMBER
								+ "!=\"\"))";

						// 执行查询
						phoneCursor = context
								.getContentResolver()
								.query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI,
										selectNum, numSelect, null, null);

						if (phoneCursor == null) {
							// 异常，查询失败
							Toast.makeText(context,
									"Error: query phone number returns null", Toast.LENGTH_LONG).show();
							if (cursor != null && !cursor.isClosed())
								cursor.close();
							return null;
						} else if (phoneCursor.getCount() <= 0) {
							// 未找到电话号码
							Toast.makeText(context,
									"Failed: no phone number found. name: "
											+ name, Toast.LENGTH_LONG).show();
							if (cursor != null && !cursor.isClosed())
								cursor.close();
							if (phoneCursor != null && !phoneCursor.isClosed())
								phoneCursor.close();
							return null;
						}
						Logger.d(TAG,
								"Phone number count: " + phoneCursor.getCount());

						// 遍历获取所有电话号码
						if (phoneCursor.moveToFirst()) {
							while (!phoneCursor.isAfterLast()) {
								String phoneNum = phoneCursor
										.getString(COL_NUM);
								Logger.i(TAG,
										"Phone number type: "
												+ phoneCursor
														.getString(COL_TYPE));
								// 由于部分用户设置了手机和SIM卡同时存储联系人，导致联系人信息有重复，但ID却不同的情况
								// 过滤相同的电话号码
								boolean isDuplicate = false;
								for (int i = 0; i < nums.size(); i++) {
									if (nums.get(i).equals(phoneNum)) {
										isDuplicate = true;
										break;
									}
								}
								if (!isDuplicate)
									nums.add(phoneNum);
								else
									Logger.d(TAG, "duplicate phone number: "
											+ phoneNum);

								Logger.d(TAG, "Add phone number: " + phoneNum);
								phoneCursor.moveToNext();
							}
						}

					} else {
						// 该联系人没有电话号码
						Toast.makeText(context,
										"Contact phone number not found! name: "
												+ name, Toast.LENGTH_LONG).show();
					cursor.moveToNext();
				}
			}
			}

		} catch (Exception e) {
			e.printStackTrace();
			Logger.e(TAG, e.toString());
		} finally {
			if (cursor != null && !cursor.isClosed()) {
				cursor.close();
			}
			if (phoneCursor != null && !phoneCursor.isClosed()) {
				phoneCursor.close();
			}
		}

		return nums;
	}

	/**
	 * 获取手机联系人姓名列表 重名的联系人不重复
	 * 
	 * @param context
	 * @return
	 */
	public ArrayList<String> getContactsNameList() {
		ArrayList<String> contacts = new ArrayList<String>();
		String logger = "";

		// 选择需要读取的字段
		/** 读取联系人信息：姓名、是否有电话号码、ID */
		final String[] selectContact = { ContactsContract.Contacts.DISPLAY_NAME };
		final int COL_NAME = 0;

		Cursor cursor = null;
		try {
			// 执行查询
			cursor = mContext.getContentResolver().query(
					ContactsContract.Contacts.CONTENT_URI,
					selectContact,
					null,
					null,
					ContactsContract.Contacts.DISPLAY_NAME
							+ " COLLATE LOCALIZED ASC");

			if (cursor == null) {
				// 异常，查询失败
				Toast.makeText(mContext,
						"Error: query contact returns null", Toast.LENGTH_LONG).show();;
				return null;
			} else if (cursor.getCount() <= 0) {
				// 未找到指定联系人
				Toast.makeText(mContext, "Failed: no contact found.", Toast.LENGTH_LONG).show();
				if (cursor != null && !cursor.isClosed())
					cursor.close();
				return null;
			}
			Logger.d(TAG, "Contacts count: " + cursor.getCount());

			if (cursor.moveToFirst()) {
				while (!cursor.isAfterLast()) {

					String contactName = cursor.getString(COL_NAME);
					if (!TextUtils.isEmpty(contactName)) {
						if (StringUtils.searchList(contacts, contactName)) {
							// Loggers.d(TAG, "duplicate contact: " + contactName);
						} else {
							contacts.add(contactName);
							logger += contactName + ";";
						}
					}
					cursor.moveToNext();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (cursor != null && !cursor.isClosed())
				cursor.close();
		}

		Logger.i(TAG, "Phone contacts name list: " + logger);
		return contacts;
	}

	/**
	 * 检查SIM卡状态是否就绪
	 * 
	 * @param context
	 * @return
	 */
	public static boolean isSimCardExist(Context context) {

		TelephonyManager tm;
		try {
			tm = (TelephonyManager) context
					.getSystemService(Context.TELEPHONY_SERVICE);
			if (tm != null) {
				if (TelephonyManager.SIM_STATE_ABSENT == tm.getCallState()) {
					return false;
				} else {
					Logger.i(TAG, "SIM state: " + tm.getCallState());
					if (tm.getNetworkType() == TelephonyManager.NETWORK_TYPE_UNKNOWN) {
						Logger.e(TAG, "isSimCardExist | NETWORK_TYPE_UNKNOWN");
						return false;
					} else {
						Logger.i(TAG, "SIM net type: " + tm.getNetworkType());
					}
				}
			} else {
				Logger.e(TAG, "cann't get TelephonyManager handler.");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			Logger.e(TAG, e.toString());
		}
		Logger.d(TAG, "isSimCardExist | return true");
		return true;
	}

	/**
	 * 获取当前联系人数据库版本号（拼成一个字符串返回，以;隔开）
	 * 
	 * @param context
	 *            上下文
	 * @return 联系人数据库版本号
	 */
	public String getContactsVersion() {
		Logger.d(TAG, "getContactVersion");
		String versionList = "";
		Cursor cursor = null;

		try {
			String[] select = { RawContacts.VERSION };
			cursor = mContext.getContentResolver().query(
					ContactsContract.RawContacts.CONTENT_URI, select, null,
					null, null);
			if (cursor != null) {
				String version = null;
				int ver_col = cursor
						.getColumnIndex(ContactsContract.RawContacts.VERSION);
				// Loggers.d(TAG, "getContactVersion | ver_col: " + ver_col +
				// " cursor count: " + cursor.getCount());
				if (cursor.moveToFirst()) {
					for (int i = 0; i < cursor.getCount(); i++) {
						version = cursor.getString(ver_col);
						// Loggers.d(TAG, "getContactVersion | get version: " +
						// version);

						if (!TextUtils.isEmpty(version)) {
							versionList += version + ';';
						}

						cursor.moveToNext();
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			e.toString();
		} finally {
			if (cursor != null && !cursor.isClosed()) {
				cursor.close();
			}
		}

		Logger.d(TAG, "getContactVersion | versionList: " + versionList);
		return versionList;
	}
}

