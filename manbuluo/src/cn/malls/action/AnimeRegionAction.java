package cn.malls.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.malls.bean.AnimeRegion;
import cn.malls.service.AnimeRegionService;

/**
 * categoryControl
 * @author »ÆÖÐÕý
 *
 */
@Controller
public class AnimeRegionAction extends ActionSupport implements ModelDriven<AnimeRegion>{
	@Autowired
	private AnimeRegionService animeRegionService;
	private AnimeRegion animeRegion = new AnimeRegion();
	@Override
	public AnimeRegion getModel() {
		// TODO Auto-generated method stub
		return animeRegion;
	}
	

}
