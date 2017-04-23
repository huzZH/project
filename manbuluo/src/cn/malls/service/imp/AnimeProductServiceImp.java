package cn.malls.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.malls.bean.AnimeProduct;
import cn.malls.dao.AnimeProductDao;
import cn.malls.service.AnimeProductService;
import cn.malls.web.PageBean;
@Service
public class AnimeProductServiceImp implements AnimeProductService{
	
	@Resource
	private AnimeProductDao animeProductDao;

	@Override
	public List<AnimeProduct> getHotProduct() {
		// TODO Auto-generated method stub
		
		return animeProductDao.getHotProduct();
	}

	@Override
	public List<AnimeProduct> getNewProduct() {
		// TODO Auto-generated method stub
		return animeProductDao.getNewProduct();
	}

	@Override
	public AnimeProduct getProductById(int pid) {
		// TODO Auto-generated method stub
		return animeProductDao.getProductById(pid);
	}

	@Override
	public PageBean<AnimeProduct> findByPage(int arId, int page) {
		// TODO Auto-generated method stub
		
		
		int limit = 12; // ÿҳ��ʾ��¼��.
		int totalPage = 0; // ��ҳ��
		PageBean<AnimeProduct> pageBean = new PageBean<AnimeProduct>();
		pageBean.setPage(page);
		pageBean.setLimit(limit);
		// ��ѯ�ܼ�¼��:
		Integer totalCount = animeProductDao.findCountByArId(arId);
		pageBean.setTotalCount(totalCount);
		// ��ҳ���ķ�װ
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// ��Ʒ���ݼ���:
		int begin = (page - 1) * limit;
		List<AnimeProduct> list = animeProductDao.findByPage(arId,begin ,limit);
		pageBean.setList(list);
		return pageBean;
		
	}

	@Override
	public PageBean<AnimeProduct> findByANid(int arId, int page) {
		// TODO Auto-generated method stub
		int limit = 12; // ÿҳ��ʾ��¼��.
		int totalPage = 0; // ��ҳ��
		PageBean<AnimeProduct> pageBean = new PageBean<AnimeProduct>();
		pageBean.setPage(page);
		pageBean.setLimit(limit);
		// ��ѯ�ܼ�¼��:
		Integer totalCount = animeProductDao.findCountByANId(arId);
		pageBean.setTotalCount(totalCount);
		// ��ҳ���ķ�װ
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// ��Ʒ���ݼ���:
		int begin = (page - 1) * limit;
		List<AnimeProduct> list = animeProductDao.findByANid(arId,begin ,limit);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public PageBean<AnimeProduct> findByACid(int acId, int page) {
		// TODO Auto-generated method stub
		int limit = 12; // ÿҳ��ʾ��¼��.
		int totalPage = 0; // ��ҳ��
		PageBean<AnimeProduct> pageBean = new PageBean<AnimeProduct>();
		pageBean.setPage(page);
		pageBean.setLimit(limit);
		// ��ѯ�ܼ�¼��:
		Integer totalCount = animeProductDao.findCountByACId(acId);
		pageBean.setTotalCount(totalCount);
		// ��ҳ���ķ�װ
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// ��Ʒ���ݼ���:
		int begin = (page - 1) * limit;
		List<AnimeProduct> list = animeProductDao.findByACid(acId,begin ,limit);
		pageBean.setList(list);
		return pageBean;
	}
}
