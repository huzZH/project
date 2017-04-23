package cn.malls.dao.imp;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.malls.bean.Cart;
import cn.malls.bean.CartInfo;
import cn.malls.dao.CartDao;

@Repository
public class CartDaoImp extends HibernateDaoSupport implements CartDao{
	@Resource
	private void setHiber(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Override
	public Cart findCartByAccountId(Integer accountId) {
		// TODO Auto-generated method stub
		String hql = "from Cart where accountId = ?";
		List<Cart> list = (List<Cart>) this.getHibernateTemplate().find(hql,accountId);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public Cart createCart(Cart cart) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(cart);
		return findCartByAccountId(cart.getAccountId());
	}

	@Override
	public List<CartInfo> getThereCartInfo(Integer accountId) {
		// TODO Auto-generated method stub
	//	String hql = "from Cart cart where cart.accountId= ? order by";
/*		String h = "SELECT sc.`id`,sc.`account_id`,sc.`add_time`,sc.`total_quantity`,sc.`total_price`,"
				+ "ci.`id`,ci.`product_id`,ci.`product_name`,ci.`product_color_id`,ci.`product_image`,"
				+ "ci.`product_size_id`,ci.`quantity`,ci.`unit_price`,ci.`shopping_cart_id`,ci.`add_time` "
				+ "FROM shopping_cart sc, cart_info ci WHERE sc.`id` = ci.`shopping_cart_id` ORDER BY ci.`add_time`  DESC LIMIT 0, 3";
*/
//		String sql = "SELECT * FROM shopping_cart sc, cart_info ci WHERE sc.`id` = ci.`shopping_cart_id` ORDER BY ci.`add_time`  DESC LIMIT 0, 3";
//		String hql = "from Cart cart where cart.accountId = ?";
//		List<Cart> list = (List<Cart>)getSession().createSQLQuery(h).list();
		
		String hql = "from Cart where accountId = ?";
		String hq2 = "from CartInfo where cartId = ? order by addTime desc"; 
		
		List<Cart> cartList = (List<Cart>)this.getHibernateTemplate().find(hql,accountId);
		if(cartList != null && cartList.size() > 0) {
			int cartId = cartList.get(0).getId();
			List<CartInfo> list = (List<CartInfo>)getSession().createQuery(hq2).setFirstResult(0).setMaxResults(3).setInteger(0, cartId).list();
			if(list != null && list.size() > 0){
				return list;
			}
		}else {
			Cart cart = new Cart();
			cart.setAccountId(accountId);
			createCart(cart);
		}
		return null;
	}

	@Override
	public List<Cart> getUserCart(Integer cartId) {
		// TODO Auto-generated method stub
		String hql = "from Cart where id = ?";
		List<Cart> list = (List<Cart>) this.getHibernateTemplate().find(hql, cartId);
		if(list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
}
