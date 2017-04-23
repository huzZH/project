package cn.malls.dao;

import java.util.List;

import cn.malls.bean.AnimeProduct;

public interface AnimeProductDao {
	//
	public List<AnimeProduct> getHotProduct();
	//
	public List<AnimeProduct> getNewProduct();
	//
	public AnimeProduct getProductById(int pid);
	//
	public Integer findCountByArId(int arId);
	//
	public List<AnimeProduct> findByPage(int arId, int begin, int limit);
	//
	public Integer findCountByANId(int arId);
	//
	public List<AnimeProduct> findByANid(int arId, int begin, int limit);
	//
	public Integer findCountByACId(int acId);
	//
	public List<AnimeProduct> findByACid(int acId, int begin, int limit);	
}
