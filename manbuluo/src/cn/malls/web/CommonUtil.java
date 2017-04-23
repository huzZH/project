package cn.malls.web;

import javax.servlet.http.HttpServletRequest;

import cn.malls.bean.Account;

public class CommonUtil {
	
	public static Boolean isExistUser(HttpServletRequest request){
		
		Account account = (Account) request.getSession().getAttribute("existAccount");
		
		if(account == null){
			return false;
		}
		return true;
	}
	
	
}
