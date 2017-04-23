package cn.malls.dao.imp;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.malls.bean.AnimeProduct;
import cn.malls.dao.AnimeProductDao;
import cn.malls.web.PageHibernateCallback;
import cn.malls.web.PageUtil;

@Repository
public class AnimeProductDaoImp extends HibernateDaoSupport implements AnimeProductDao{
	//注入
    @Resource
    public void setHiber(SessionFactory sessionFactory){
    	super.setSessionFactory(sessionFactory);
    }

	@SuppressWarnings("deprecation")
	@Override
	public List<AnimeProduct> getHotProduct() {
		// TODO Auto-generated method stub
		String hql = "from AnimeProduct as product where product.isHot = ?";
		List<AnimeProduct> list = (List<AnimeProduct>) this.getHibernateTemplate().executeFind(new HibernateCallback(){
			@Override
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				
				return PageUtil.getList(session, hql, 0, 6, (byte)1);
			}
		});
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

	@Override
	public List<AnimeProduct> getNewProduct() {
		// TODO Auto-generated method stub
		String hql = "from AnimeProduct as product where product.isNew = ?";
		List<AnimeProduct> list = (List<AnimeProduct>) this.getHibernateTemplate().executeFind(new HibernateCallback(){
			@Override
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				
				return PageUtil.getList(session, hql, 0, 6, (byte)1);
			}
		});
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

	@Override
	public AnimeProduct getProductById(int pid) {
		// TODO Auto-generated method stub
		String hql = "from AnimeProduct as product where product.id = ?";
		List<AnimeProduct> list = (List<AnimeProduct>) this.getHibernateTemplate().find(hql, pid);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	/**
	 * 根据商品地域分类ID查询商品总数
	 */
	@Override
	public Integer findCountByArId(int arId) {
		// TODO Auto-generated method stub
		String hql = "SELECT COUNT(*) FROM AnimeProduct ap, AnimeName an WHERE ap.animeName_id = an.id AND an.animeRegion.id = ?";
		List<?> list = this.getHibernateTemplate().find(hql, arId);
		System.out.println("查询到的商品数量为：" + list.get(0));
		String string = list.get(0).toString();
		return Integer.parseInt(string);
	}
	/**
	 * 分页查询
	 */
	@Override
	public List<AnimeProduct> findByPage(int arId, int begin, int limit) {
		// TODO Auto-generated method stub
		
		String hql = "SELECT ap FROM AnimeProduct ap, AnimeName an WHERE ap.animeName_id = an.id AND an.animeRegion.id = ?";
		List<AnimeProduct> list = (List<AnimeProduct>) this.getHibernateTemplate().executeFind(new PageHibernateCallback<AnimeProduct>(hql, new Object[]{arId}, begin, limit));
		return list;
	}

	@Override
	public Integer findCountByANId(int arId) {
		// TODO Auto-generated method stub
		String hql = "SELECT COUNT(*) FROM AnimeProduct ap where ap.animeName_id = ?";
		List<?> list = this.getHibernateTemplate().find(hql, arId);
		System.out.println("查询到的商品数量为：" + list.get(0));
		String string = list.get(0).toString();
		return Integer.parseInt(string);
	}

	@Override
	public List<AnimeProduct> findByANid(int arId, int begin, int limit) {
		// TODO Auto-generated method stub
		String hql = "SELECT ap FROM AnimeProduct ap where ap.animeName_id = ?";
		List<AnimeProduct> list = (List<AnimeProduct>) this.getHibernateTemplate().executeFind(new PageHibernateCallback<AnimeProduct>(hql, new Object[]{arId}, begin, limit));
		return list;
	}

	@Override
	public Integer findCountByACId(int acId) {
		// TODO Auto-generated method stub
		String hql = "SELECT COUNT(*) FROM AnimeProduct ap where ap.animeCategory_id = ?";
		List<?> list = this.getHibernateTemplate().find(hql, acId);
		System.out.println("查询到的商品数量为：" + list.get(0));
		String string = list.get(0).toString();
		return Integer.parseInt(string);
	}

	@Override
	public List<AnimeProduct> findByACid(int acId, int begin, int limit) {
		// TODO Auto-generated method stub
		String hql = "SELECT ap FROM AnimeProduct ap where ap.animeCategory_id = ?";
		List<AnimeProduct> list = (List<AnimeProduct>) this.getHibernateTemplate().executeFind(new PageHibernateCallback<AnimeProduct>(hql, new Object[]{acId}, begin, limit));
		return list;
	}
}
