package cn.malls.service.imp;

import java.security.NoSuchAlgorithmException;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.malls.bean.Account;
import cn.malls.bean.Member;
import cn.malls.dao.AccountDao;
import cn.malls.service.AccountService;
import cn.malls.web.MD5Util;
@Service
@Transactional
public class AccountServiceImp implements AccountService{

	@Resource
	private AccountDao accountDao;
	@Override
	public void createAccount(Account account)throws Exception {
		// TODO Auto-generated method stub
		String encodingPassword = MD5Util.EncodingByMD5(account.getPassword());
		account.setPassword(encodingPassword);
		account.setCreateDate(new Date());
		accountDao.createAccount(account);
	}
	/*
	 * ajax–£—È(non-Javadoc)
	 * @see cn.malls.service.AccountService#ajaxUsername(java.lang.String)
	 */
	@Override
	public Boolean ajaxUsername(String username)throws Exception {
		// TODO Auto-generated method stub
		return accountDao.ajaxUsername(username);
	}
	@Override
	public Account findAccount(Account account) throws Exception {
		// TODO Auto-generated method stub
		Account queryAccount = accountDao.findAccount(account.getUsername());
		if(queryAccount != null && MD5Util.checkMD5Password(account.getPassword(), queryAccount.getPassword())){
			return queryAccount;
		}
		return null;
	}
	/**
	 * –ﬁ∏ƒ√‹¬Î
	 * @throws Exception 
	 * @throws NoSuchAlgorithmException 
	 */
	@Override
	public Boolean updatePassword(String username, String oldPassword, String newPassword) throws Exception {
		// TODO Auto-generated method stub
		Account account = accountDao.findAccount(username);
		String encodingPassword = MD5Util.EncodingByMD5(oldPassword);
		if(account.getPassword().equals(encodingPassword)) {
			accountDao.updatePassword(username, MD5Util.EncodingByMD5(newPassword));
			return true;
		}
		
		return false;
	}
	@Override
	public void addMember(Member member) {
		// TODO Auto-generated method stub
		accountDao.addMember(member);
	}


}
