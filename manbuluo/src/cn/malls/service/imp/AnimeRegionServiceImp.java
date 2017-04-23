package cn.malls.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.malls.bean.AnimeRegion;
import cn.malls.dao.AnimeRegionDao;
import cn.malls.service.AnimeRegionService;
/**
 * General ledger(�ܷ���)
 * @author ������
 *
 */
@Service
public class AnimeRegionServiceImp implements AnimeRegionService{
	@Resource
	private AnimeRegionDao animeRegionDao;

	@Override
	public List<AnimeRegion> getAnimeRegion() {
		// TODO Auto-generated method stub
		return animeRegionDao.getAnimeRegion();
	}
}
