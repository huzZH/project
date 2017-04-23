package cn.malls.dao.imp;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.malls.bean.SlippingAddress;
import cn.malls.dao.SlippingAddressDao;

/**
 * 收货地址持久层
 * @author 黄中正
 *
 */
@Repository
public class SlippingAddressDaoImp extends HibernateDaoSupport implements SlippingAddressDao{
	
	@Resource
	private void setHiber(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Override
	public List<SlippingAddress> getSlipAddress(Integer accountId) {
		// TODO Auto-generated method stub
		String hql = "from SlippingAddress sa where sa.accountId = ?";
		List<SlippingAddress> list = (List<SlippingAddress>) this.getHibernateTemplate().find(hql, accountId);
		if(list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	/**
	 * 新增收货地址
	 */
	@Override
	public void saveSlipAddress(SlippingAddress slipAddress) {
		// TODO Auto-generated method stub
	//	this.getHibernateTemplate().save(slipAddress);
		this.getHibernateTemplate().saveOrUpdate(slipAddress);
	}

	@Override
	public SlippingAddress findSlipAddressById(Integer id, Integer accountId) {
		// TODO Auto-generated method stub
		String hql = "from SlippingAddress where id = ? and accountId = ?";
		List<SlippingAddress> list = (List<SlippingAddress>) this.getHibernateTemplate().find(hql, id,accountId);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void update(SlippingAddress sa) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(sa);
	}

	@Override
	public List<SlippingAddress> findSlipAddress(Integer accountId) {
		// TODO Auto-generated method stub
		String hql = "from SlippingAddress where accountId = ?";
		List<SlippingAddress> list = (List<SlippingAddress>) this.getHibernateTemplate().find(hql,accountId);
		if(list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	@Override
	public void delete(SlippingAddress slipAddress) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(slipAddress);
	}
	
	

}
