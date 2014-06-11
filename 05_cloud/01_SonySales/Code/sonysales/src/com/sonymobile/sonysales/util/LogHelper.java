package com.sonymobile.sonysales.util;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;

import net.sf.json.JSONArray;

import com.sina.sae.kvdb.SaeKV;
import com.sina.sae.kvdb.SaeKVUtil;
import com.sonymobile.sonysales.entity.PageView;
import com.sonymobile.sonysales.entity.UserOperation;

public class LogHelper {

	private static int increment = 1;
	private static final String KEY_FILLING = "000000000000000000000000";
	private static Logger logger = Logger.getLogger(LogHelper.class.getName());

	public static boolean addPVLog(String openId, String pageName, String ip) {
		boolean ret = false;
		PageView pv = new PageView();
		if (pv != null) {
			pv.setOpenId(openId);
			pv.setPageName(pageName);
			pv.setIp(ip);

			ret = set(pv);
		}
		return ret;
	}

	public static boolean addOperationLog(String openId, int pageName,
			int operation, String ip) {
		boolean ret = false;
		UserOperation uo = new UserOperation();
		if (uo != null && pageName > 0 && operation > 0) {
			uo.setOpenId(openId);
			uo.setPageName(PAGE_NAME_MAP.get(pageName));
			uo.setOperation(OPERATION_MAP.get(operation));
			uo.setIp(ip);
			ret = set(uo);
		}
		return ret;
	}

	private static boolean set(Object o) {
		boolean ret = false;
		if (o != null) {
			String v = JSONArray.fromObject(o).toString();
			ret = set(getCurrentKey(), v);
		}
		return ret;
	}

	public static Map<String, String> getMultiLogs(String prefixKey) {
		Map<String, String> ret = new HashMap<String, String>();
		String key = null;
		try {
			if (prefixKey == null || prefixKey.length() > 24) {
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				prefixKey = sdf.format(date);
			}
			String compareKey = prefixKey
					+ KEY_FILLING.substring(prefixKey.length());
			SaeKV kv = new SaeKV();
			kv.init();
			Map<String, Object> retObject = kv.pkrget(prefixKey, 100,
					compareKey);

			Set<String> keys = retObject.keySet();
			for (Iterator<String> it = keys.iterator(); it.hasNext();) {
				key = (String) it.next();
				ret.put(key,
						SaeKVUtil.byteToString((byte[]) retObject.get(key)));
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Exception in getMultiLogs :" + e.toString()
					+ " message: " + e.getMessage());
		}
		return ret;
	}

	private static boolean set(String k, String v) {
		boolean ret = false;
		if (k != null && v != null) {
			try {
				byte[] buf = SaeKVUtil.StringToByte(v);
				SaeKV kv = new SaeKV();
				kv.init();
				ret = kv.set(k, buf);
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("Exception in set k:" + k + " v:" + v
						+ ", ToString: " + e.toString() + " message: "
						+ e.getMessage());
			}
		}
		return ret;
	}

	public static boolean remove(String k) {
		boolean ret = false;
		if (k != null) {
			try {
				SaeKV kv = new SaeKV();
				kv.init();
				ret = kv.delete(k);
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("Exception in remove k:" + k + ", ToString: "
						+ e.toString() + " message: " + e.getMessage());
			}
		}
		return ret;
	}

	private synchronized static String getCurrentKey() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String now = sdf.format(date);
		DecimalFormat df = new DecimalFormat("0000000000");

		return now + df.format(increment++);
	}

	private static final HashMap<Integer, String> PAGE_NAME_MAP;
	private static final HashMap<Integer, String> OPERATION_MAP;

	static {
		PAGE_NAME_MAP = new HashMap<Integer, String>();
		OPERATION_MAP = new HashMap<Integer, String>();

		PAGE_NAME_MAP.put(1, "描述页");
		PAGE_NAME_MAP.put(2, "大奖榜");
		PAGE_NAME_MAP.put(3, "拉人气宣传页");
		PAGE_NAME_MAP.put(4, "拉人气接收页");
		PAGE_NAME_MAP.put(5, "我的战况");
		PAGE_NAME_MAP.put(6, "快报页");
		PAGE_NAME_MAP.put(7, "支持好友列表");

		OPERATION_MAP.put(1, "大奖榜");
		OPERATION_MAP.put(2, "拉人气宣传页");
		OPERATION_MAP.put(3, "我的战况");
		OPERATION_MAP.put(4, "拉人气宣传页");
		OPERATION_MAP.put(5, "快报页");
		OPERATION_MAP.put(6, "手机购买页（京东）");
		OPERATION_MAP.put(7, "选择Sony手机");
		OPERATION_MAP.put(8, "PC购买页");
		OPERATION_MAP.put(9, "优惠券页（京东）");
		OPERATION_MAP.put(10, "支持");

		OPERATION_MAP.put(11, "谁支持了我");
		OPERATION_MAP.put(12, "优惠卷页（京东）");
		OPERATION_MAP.put(13, "大奖榜");
		OPERATION_MAP.put(14, "编辑用户信息");
		OPERATION_MAP.put(15, "保存用户信息");
		OPERATION_MAP.put(16, "前往支持好友");
		OPERATION_MAP.put(17, "分享快报提升人气");

		OPERATION_MAP.put(18, "索尼智能手表Smart Watch 2");
		OPERATION_MAP.put(19, "蓝牙耳机SBH20");
		OPERATION_MAP.put(20, "支持好友列表页拉人气");
		
		OPERATION_MAP.put(100, "拉友买");
		OPERATION_MAP.put(101, "手机1款");
		OPERATION_MAP.put(102, "手机2款");
		OPERATION_MAP.put(103, "手机3款");
		OPERATION_MAP.put(104, "手机4款");
		OPERATION_MAP.put(105, "手机5款");
	}
}
