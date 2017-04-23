package cn.malls.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.malls.bean.AnimeCategory;
import cn.malls.dao.AnimeCategoryDao;
import cn.malls.service.AnimeCategoryService;
@Service
public class AnimeCategoryServiceImp implements AnimeCategoryService{
	@Resource
	private AnimeCategoryDao animeCategoryDao;

	@Override
	public List<AnimeCategory> getAnimeCategory() {
		// TODO Auto-generated method stub
		return animeCategoryDao.getAnimeCategory();
	}
}
