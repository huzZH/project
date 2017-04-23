package cn.malls.dao;

import cn.malls.bean.Account;
import cn.malls.bean.Member;

public interface AccountDao {
	//�����˺�
	public void createAccount(Account account);
	//�첽У��
	public Boolean ajaxUsername(String username);
	//
	public Account findAccount(String username);
	//�޸�����
	public void updatePassword(String username, String newPassword);
	//
	public void addMember(Member member);

}
