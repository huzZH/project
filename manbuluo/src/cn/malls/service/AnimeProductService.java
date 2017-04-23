package cn.malls.service;

import java.util.List;

import cn.malls.bean.AnimeProduct;
import cn.malls.web.PageBean;

public interface AnimeProductService {
	//
	public List<AnimeProduct> getHotProduct();
	//
	public List<AnimeProduct> getNewProduct();
	//
	public AnimeProduct getProductById(int pid);
	//
	public PageBean<AnimeProduct> findByPage(int arId, int page);
	//
	public PageBean<AnimeProduct> findByANid(int arId, int page);
	//
	public PageBean<AnimeProduct> findByACid(int acId, int page);
	
}
