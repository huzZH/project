package cn.malls.web;

import java.util.HashMap;
import java.util.Map;

public class CommonConstant {
	public static  Map map = new HashMap();
	public static String getBank(String name) {
		map.put("ICBC-NET-B2C", "中国工商银行");
		map.put("BOC-NET-B2C", "中国银行");
		map.put("ABC-NET-B2C", "农业银行");
		map.put("BOCO-NET-B2C", "交通银行");
		map.put("PINGANBANK-NET", "平安银行");
		map.put("CCB-NET-B2C", "建设银行");
		map.put("CEB-NET-B2C", "光大银行");
		map.put("CMBCHINA-NET-B2C", "招商银行");
		return (String) map.get(name);
	}
}
