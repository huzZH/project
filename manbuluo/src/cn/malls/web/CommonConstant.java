package cn.malls.web;

import java.util.HashMap;
import java.util.Map;

public class CommonConstant {
	public static  Map map = new HashMap();
	public static String getBank(String name) {
		map.put("ICBC-NET-B2C", "�й���������");
		map.put("BOC-NET-B2C", "�й�����");
		map.put("ABC-NET-B2C", "ũҵ����");
		map.put("BOCO-NET-B2C", "��ͨ����");
		map.put("PINGANBANK-NET", "ƽ������");
		map.put("CCB-NET-B2C", "��������");
		map.put("CEB-NET-B2C", "�������");
		map.put("CMBCHINA-NET-B2C", "��������");
		return (String) map.get(name);
	}
}
