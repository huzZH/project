package cn.malls.dao.imp;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.malls.bean.CartInfo;
import cn.malls.dao.CartInfoDao;

@Repository
public class CartInfoDaoImp extends HibernateDaoSupport implements CartInfoDao{
	@Resource
	private void setHiber(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Override
	public void saveCartInfo(CartInfo cartInfo) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(cartInfo);
	}

	@Override
	public void deleteSingleCart(CartInfo cartInfo) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(cartInfo);
	}

	@Override
	public CartInfo getCartInfoById(Integer cartInfoId) {
		// TODO Auto-generated method stub
		String hql = "from CartInfo where id = ?";
		List<CartInfo> list = (List<CartInfo>) this.getHibernateTemplate().find(hql, cartInfoId);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	/**
	 * 批量删除购物车信息
	 */
	@Override
	public void deleteListCart(List listId) {
		// TODO Auto-generated method stub
		String hql = "";
		for(int i = 0; i < listId.size(); i++) {
			if(i == 0) {
				hql = "id = " + listId.get(i).toString();
			}else {
				hql = hql + " or id = " + listId.get(i).toString();
			}
		}
		System.out.println(hql);
		Query query = this.getSession().createQuery("delete from CartInfo where " + hql);
//		SQLQuery query = this.getSession().createSQLQuery("delete from cart_info where " + hql);
		query.executeUpdate();
		
	}
	/*
	 * (non-Javadoc)
	 * @see cn.malls.dao.CartInfoDao#getCartInfoList(java.util.List)
	 */
	@Override
	public List<CartInfo> getCartInfoList(List listId) {
		// TODO Auto-generated method stub
		String hql = "";
		for(int i = 0; i < listId.size(); i++) {
			if(i == 0) {
				hql = "id = " + listId.get(i);
			}else {
				hql = hql + " or id = " + listId.get(i);
			}
		}
		List list = this.getSession().createQuery("from CartInfo where " + hql).list();
		if(list != null && list.size() > 0) {
			return list;
		}
		return null;
	}


}
