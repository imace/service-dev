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
	private static String ccurrentKey = "1";
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

	public static Map<String, String> getMultiLogs() {
		Map<String, String> ret = new HashMap<String, String>();
		String key = null;
		try {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String now = sdf.format(date);
			SaeKV kv = new SaeKV();
			kv.init();
			Map<String, Object> retObject = kv.pkrget(now, 100, now
					+ "0000000000000000");

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

	public static String get() {
		return get(ccurrentKey);
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

	private static String get(String k) {
		String ret = null;
		if (k != null) {
			try {
				SaeKV kv = new SaeKV();
				kv.init();
				byte[] buf = (byte[]) kv.get(k);
				ret = SaeKVUtil.byteToString(buf);
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("Exception in get k:" + k + ", ToString: "
						+ e.toString() + " message: " + e.getMessage());
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
		ccurrentKey = now + df.format(increment++);
		return ccurrentKey;
	}

	private static final HashMap<Integer, String> PAGE_NAME_MAP;
	private static final HashMap<Integer, String> OPERATION_MAP;

	static {
		PAGE_NAME_MAP = new HashMap<Integer, String>();
		OPERATION_MAP = new HashMap<Integer, String>();

		PAGE_NAME_MAP.put(1, "����ҳ");
		PAGE_NAME_MAP.put(2, "�󽱰�");
		PAGE_NAME_MAP.put(3, "����������ҳ");
		PAGE_NAME_MAP.put(4, "����������ҳ");
		PAGE_NAME_MAP.put(5, "�ҵ�ս��");
		PAGE_NAME_MAP.put(6, "�챨ҳ");

		OPERATION_MAP.put(1, "�󽱰�");
		OPERATION_MAP.put(2, "����������ҳ");
		OPERATION_MAP.put(3, "�ҵ�ս��");
		OPERATION_MAP.put(4, "����������ҳ");
		OPERATION_MAP.put(5, "�챨ҳ");
		OPERATION_MAP.put(6, "�ֻ�����ҳ��������");
		OPERATION_MAP.put(7, "ѡ��Sony�ֻ�");
		OPERATION_MAP.put(8, "PC����ҳ");
		OPERATION_MAP.put(9, "�Ż�ȯҳ��������");
		OPERATION_MAP.put(10, "֧��");

		OPERATION_MAP.put(12, "�Żݾ�ҳ��������");
		OPERATION_MAP.put(13, "�󽱰�");
		OPERATION_MAP.put(14, "�༭�û���Ϣ");
		OPERATION_MAP.put(15, "�����û���Ϣ");
		OPERATION_MAP.put(16, "ǰ��֧�ֺ���");
		OPERATION_MAP.put(17, "����챨��������");

		OPERATION_MAP.put(18, "���������ֱ�Smart Watch 2");
		OPERATION_MAP.put(19, "��������SBH20");

		OPERATION_MAP.put(100, "������");
		OPERATION_MAP.put(101, "�ֻ�1��");
		OPERATION_MAP.put(102, "�ֻ�2��");
		OPERATION_MAP.put(103, "�ֻ�3��");
		OPERATION_MAP.put(104, "�ֻ�4��");
		OPERATION_MAP.put(105, "�ֻ�5��");
	}
}
