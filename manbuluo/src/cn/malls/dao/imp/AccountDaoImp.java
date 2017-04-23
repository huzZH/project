package cn.malls.dao.imp;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.malls.bean.Account;
import cn.malls.bean.Member;
import cn.malls.dao.AccountDao;
@Repository
public class AccountDaoImp extends HibernateDaoSupport implements AccountDao{
	
	//注入
    @Resource
    public void setHiber(SessionFactory sessionFactory){
    	super.setSessionFactory(sessionFactory);
    }
	@Override
	public void createAccount(Account account) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(account);
	}
	/*
	 * 异步校验(non-Javadoc)
	 * @see cn.malls.dao.AccountDao#ajaxUsername(java.lang.String)
	 */
	@Override
	public Boolean ajaxUsername(String username) {
		// TODO Auto-generated method stub
		String hql = "from Account where username = ?";
		List<Account> list = (List<Account>) this.getHibernateTemplate().find(hql, username);
		if(list != null && list.size() > 0){
			return true;
		}
		return false;
	}
	@Override
	public Account findAccount(String username) {
		// TODO Auto-generated method stub
		String hql = "from Account where username = ?";
		List<Account> list = (List<Account>) this.getHibernateTemplate().find(hql, username);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	/**
	 * 修改密码
	 */
	@Override
	public void updatePassword(String username, String newPassword) {
		// TODO Auto-generated method stub
		String hql = "update Account set password = ? where username = ?";
		Query query = this.getSession().createQuery(hql);
		query.setString(0, newPassword);
		query.setString(1, username);
		query.executeUpdate();
	}
	/**
	 * @Description 添加用户信息
	 */
	@Override
	public void addMember(Member member) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(member);
	}
	
}
