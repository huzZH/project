package cn.malls.service;

import cn.malls.bean.Account;
import cn.malls.bean.Member;

public interface AccountService {
	public void createAccount(Account account) throws Exception;
	
	public Boolean ajaxUsername(String username) throws Exception;
	
	public Account findAccount(Account account) throws Exception;

	public Boolean updatePassword(String username, String oldPassword, String newPassword) throws Exception;

	public void addMember(Member member);

	
}
