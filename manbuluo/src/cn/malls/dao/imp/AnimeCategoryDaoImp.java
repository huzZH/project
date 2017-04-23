package cn.malls.dao.imp;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.malls.bean.AnimeCategory;
import cn.malls.dao.AnimeCategoryDao;

@Repository
public class AnimeCategoryDaoImp extends HibernateDaoSupport implements AnimeCategoryDao{

	@Resource
	public void setHiber(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}

	@Override
	public List<AnimeCategory> getAnimeCategory() {
		// TODO Auto-generated method stub
		String hql = "from AnimeCategory";
		@SuppressWarnings("unchecked")
		List<AnimeCategory> list = (List<AnimeCategory>) this.getHibernateTemplate().find(hql);
		this.getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	} 
	
}
