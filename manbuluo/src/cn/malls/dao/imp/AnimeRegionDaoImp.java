package cn.malls.dao.imp;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.malls.bean.AnimeRegion;
import cn.malls.dao.AnimeRegionDao;
@SuppressWarnings("deprecation")
@Repository
public class AnimeRegionDaoImp extends HibernateDaoSupport implements AnimeRegionDao{
	@SuppressWarnings("deprecation")
	@Resource
	public void setHiber(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	//获取导航条数据以及动漫名
	@SuppressWarnings("unchecked")
	@Override
	public List<AnimeRegion> getAnimeRegion() {
		// TODO Auto-generated method stub
		/*String hql = "SELECT ar.id,ar.name,ar.image,an.id,an.name,an.createDate,an.deleteDate "
				+ "FROM AnimeRegion ar JOIN AnimeName an ON ar.id=an.animeRegion.id ";*/
		//String hql = "from AnimeRegion ar ,AnimeName an where ar.id = an.animeRegion.id";
		String hql = "from AnimeRegion";
		List<AnimeRegion> list = (List<AnimeRegion>) this.getHibernateTemplate().find(hql);
		
		/*String sql = "SELECT ar.`id`,ar.`name`,ar.`image`,an.`id`,an.`name`,an.`create_time`,an.`delete_time` FROM anime_region ar JOIN anime_name an ON ar.`id`=an.`anime_region_id`";
		List<AnimeRegion> list = (List<AnimeRegion>)this.getHibernateTemplate().getSessionFactory().openSession().createSQLQuery(sql).list();
		*/
		/*Iterator<AnimeName> iterator = list.get(0).getAnimeNames().iterator();
		while(iterator.hasNext()){
			AnimeName animeName = iterator.next();
			System.out.println(animeName.getName());
		}*/
		if(list != null && list.size() > 0){
			
			return list;
		}
		return null;
	}
}
