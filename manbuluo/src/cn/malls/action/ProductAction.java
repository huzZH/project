package cn.malls.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.malls.bean.Account;
import cn.malls.bean.AnimeCategory;
import cn.malls.bean.AnimeProduct;
import cn.malls.bean.AnimeRegion;
import cn.malls.bean.CartInfo;
import cn.malls.service.AccountService;
import cn.malls.service.AnimeCategoryService;
import cn.malls.service.AnimeProductService;
import cn.malls.service.AnimeRegionService;
import cn.malls.service.CartService;
import cn.malls.web.CommonUtil;
import cn.malls.web.PageBean;
@Controller
public class ProductAction extends ActionSupport{
	
	@Autowired
	private AnimeProductService animeProductService;
	@Autowired
	private AnimeRegionService animeRegionService;
	@Autowired
	private AnimeCategoryService animeCategoryService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private CartService cartService;
	
	
	private String page;
	private String arId;
	private String anId;
	private String acId;
	
	
	
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getArId() {
		return arId;
	}
	public void setArId(String arId) {
		this.arId = arId;
	}
	public String getAnId() {
		return anId;
	}
	public void setAnId(String anId) {
		this.anId = anId;
	}
	


	public String getAcId() {
		return acId;
	}
	public void setAcId(String acId) {
		this.acId = acId;
	}
	public String findByCid() throws Exception {
		
		
		
		
		
		
		
		//获取导航条
		List<AnimeRegion> list = animeRegionService.getAnimeRegion();
		//获取分类
		List<AnimeCategory> animeCategorys = animeCategoryService.getAnimeCategory();

		ActionContext.getContext().getValueStack().set("animeNav", list);
		ActionContext.getContext().getValueStack().set("animeCategorys", animeCategorys);
		
		
		//获取用户购物车
		Boolean existUser = CommonUtil.isExistUser(ServletActionContext.getRequest());
		if(existUser){
			Account account = accountService.findAccount((Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount"));
			List<CartInfo> thereCartInfo = cartService.getThereCartInfo(account.getId());
			ActionContext.getContext().getValueStack().set("cartInfos", thereCartInfo);
		}else{
			ActionContext.getContext().getValueStack().set("cartNull", "购物车为空！");
		}
		
		
		PageBean<AnimeProduct> pageBean = animeProductService.findByPage(Integer.parseInt(arId), Integer.parseInt(page));
		int number = pageBean.getList().size();
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		ActionContext.getContext().getValueStack().set("number", number);
		
		return "productList";
	}
	
	public String findByANid() throws Exception {
		
		
		//获取导航条
		List<AnimeRegion> list = animeRegionService.getAnimeRegion();
		//获取分类
		List<AnimeCategory> animeCategorys = animeCategoryService.getAnimeCategory();

		ActionContext.getContext().getValueStack().set("animeNav", list);
		ActionContext.getContext().getValueStack().set("animeCategorys", animeCategorys);
		
		
		//获取用户购物车
		Boolean existUser = CommonUtil.isExistUser(ServletActionContext.getRequest());
		if(existUser){
			Account account = accountService.findAccount((Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount"));
			List<CartInfo> thereCartInfo = cartService.getThereCartInfo(account.getId());
			ActionContext.getContext().getValueStack().set("cartInfos", thereCartInfo);
		}else{
			ActionContext.getContext().getValueStack().set("cartNull", "购物车为空！");
		}
		
		
		PageBean<AnimeProduct> pageBean = animeProductService.findByANid(Integer.parseInt(anId), Integer.parseInt(page));
		int number = pageBean.getList().size();
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		ActionContext.getContext().getValueStack().set("number", number);
		return "productList2";
	}
	
	public String findByACid() throws Exception {
		
		
		//获取导航条
		List<AnimeRegion> list = animeRegionService.getAnimeRegion();
		//获取分类
		List<AnimeCategory> animeCategorys = animeCategoryService.getAnimeCategory();

		ActionContext.getContext().getValueStack().set("animeNav", list);
		ActionContext.getContext().getValueStack().set("animeCategorys", animeCategorys);
		
		
		//获取用户购物车
		Boolean existUser = CommonUtil.isExistUser(ServletActionContext.getRequest());
		if(existUser){
			Account account = accountService.findAccount((Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount"));
			List<CartInfo> thereCartInfo = cartService.getThereCartInfo(account.getId());
			ActionContext.getContext().getValueStack().set("cartInfos", thereCartInfo);
		}else{
			ActionContext.getContext().getValueStack().set("cartNull", "购物车为空！");
		}
		
		
		PageBean<AnimeProduct> pageBean = animeProductService.findByACid(Integer.parseInt(acId), Integer.parseInt(page));
		int number = pageBean.getList().size();
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		ActionContext.getContext().getValueStack().set("number", number);
		return "productList3";
	}
}
