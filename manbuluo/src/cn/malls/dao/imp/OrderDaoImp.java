package cn.malls.dao.imp;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cn.malls.bean.OrderDetail;
import cn.malls.bean.OrderInfo;
import cn.malls.dao.OrderDao;
@Repository
@Transactional
public class OrderDaoImp extends HibernateDaoSupport implements OrderDao{
	@Resource
	private void setHiber(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Override
	public void saveOrderItem(List<OrderDetail> orderItem) {
		// TODO Auto-generated method stub
		String hql = "";
		
	}

	@Override
	public void saveOrder(OrderInfo orderInfo) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(orderInfo);
	}

	@Override
	public OrderInfo findByOrderNumber(String orderNumber) {
		// TODO Auto-generated method stub
		String hql = "from OrderInfo where orderNumber = ?";
		List<OrderInfo> list = (List<OrderInfo>) this.getHibernateTemplate().find(hql, orderNumber);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void update(OrderInfo orderInfo) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(orderInfo);
	}

	@Override
	public List<OrderInfo> findMyOrder(Integer accountId) {
		// TODO Auto-generated method stub
		String sql = "select id from OrderInfo where accountId = ?";
		List listId = this.getHibernateTemplate().find(sql, accountId);
		if(listId == null || listId.size() < 1) {
			return null;
		}
		String hql = "";
		for(int i = 0; i < listId.size(); i++) {
			if(i == 0) {
				hql = "id = " + listId.get(i).toString();
			}else {
				hql = hql + " or id = " + listId.get(i).toString();
			}
		}
		System.out.println("from OrderInfo where " + hql);
		List<OrderInfo> list = (List<OrderInfo>) this.getHibernateTemplate().find("from OrderInfo where " + hql );
		if(list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
}
