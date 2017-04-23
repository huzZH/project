package cn.malls.dao;

import cn.malls.bean.Account;
import cn.malls.bean.Member;

public interface AccountDao {
	//创建账号
	public void createAccount(Account account);
	//异步校验
	public Boolean ajaxUsername(String username);
	//
	public Account findAccount(String username);
	//修改密码
	public void updatePassword(String username, String newPassword);
	//
	public void addMember(Member member);

}
