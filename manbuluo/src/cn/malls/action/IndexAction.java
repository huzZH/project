package cn.malls.action;

import java.util.ArrayList;
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
import cn.malls.service.CartInfoService;
import cn.malls.service.CartService;
import cn.malls.web.CommonUtil;

@Controller
public class IndexAction extends ActionSupport{
	
	@Autowired
	private AnimeRegionService animeRegionService;
	@Autowired
	private AnimeCategoryService animeCategoryService;
	@Autowired
	private AnimeProductService animeProductService;
	@Autowired
	private CartInfoService cartInfoService;
	@Autowired
	private CartService cartService;
	@Autowired
	private AccountService accountService;
	
	private Integer pid;
	
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	/*
	 * 跳转首页
	 */
	public String index() throws Exception{
		//获取导航条
		List<AnimeRegion> list = animeRegionService.getAnimeRegion();
		//获取分类
		List<AnimeCategory> animeCategorys = animeCategoryService.getAnimeCategory();
		//获取热销商品
		List<AnimeProduct> hotProducts = animeProductService.getHotProduct();
		//获取最新商品
		List<AnimeProduct> newProducts = animeProductService.getNewProduct();
		
		//获取用户购物车
		Boolean existUser = CommonUtil.isExistUser(ServletActionContext.getRequest());
		if(existUser){
			Account account = accountService.findAccount((Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount"));
			List<CartInfo> thereCartInfo = cartService.getThereCartInfo(account.getId());
			ActionContext.getContext().getValueStack().set("cartInfos", thereCartInfo);
		}else{
			ActionContext.getContext().getValueStack().set("cartNull", "购物车为空！");
		}
		

		List<AnimeProduct> hotProduct1 = new ArrayList<AnimeProduct>(hotProducts.subList(0, 3));
		List<AnimeProduct> hotProduct2 = new ArrayList<AnimeProduct>(hotProducts.subList(3, 6));
		
		
		List<AnimeProduct> newProduct1 = new ArrayList<AnimeProduct>(newProducts.subList(0, 3));
		List<AnimeProduct> newProduct2 = new ArrayList<AnimeProduct>(newProducts.subList(3, 6));
	
		
		ActionContext.getContext().getValueStack().set("animeNav", list);
		ActionContext.getContext().getValueStack().set("animeCategorys", animeCategorys);
		
		ActionContext.getContext().getValueStack().set("hotProduct1", hotProduct1);
		ActionContext.getContext().getValueStack().set("hotProduct2", hotProduct2);
		
		ActionContext.getContext().getValueStack().set("newProduct1", newProduct1);
		ActionContext.getContext().getValueStack().set("newProduct2", newProduct2);
		return "index";
	}
	/*
	 * 跳转注册界面
	 */
	public String register(){
		return "register";
	}
	/*
	 * 跳转登录界面
	 */
	public String login(){
		return "login";
	}
	/*
	 * 跳转到商品详情页
	 */
	public String jumpProductDetail() throws Exception{
		
		//获取导航条
		List<AnimeRegion> list = animeRegionService.getAnimeRegion();
		//获取分类
		List<AnimeCategory> animeCategorys = animeCategoryService.getAnimeCategory();
		//获取热销商品
		List<AnimeProduct> hotProducts = animeProductService.getHotProduct();
		//获取最新商品
		List<AnimeProduct> newProducts = animeProductService.getNewProduct();


		List<AnimeProduct> hotProduct1 = new ArrayList<AnimeProduct>(hotProducts.subList(0, 3));
		List<AnimeProduct> hotProduct2 = new ArrayList<AnimeProduct>(hotProducts.subList(3, 6));
		
		
/*		List<AnimeProduct> newProduct1 = new ArrayList<AnimeProduct>(newProducts.subList(0, 3));
		List<AnimeProduct> newProduct2 = new ArrayList<AnimeProduct>(newProducts.subList(3, 6));*/
	
		
		ActionContext.getContext().getValueStack().set("animeNav", list);
		ActionContext.getContext().getValueStack().set("animeCategorys", animeCategorys);
		
		ActionContext.getContext().getValueStack().set("hotProducts", hotProducts);
		ActionContext.getContext().getValueStack().set("hotProduct1", hotProduct1);
		ActionContext.getContext().getValueStack().set("hotProduct2", hotProduct2);
		
/*		ActionContext.getContext().getValueStack().set("newProduct1", newProduct1);
		ActionContext.getContext().getValueStack().set("newProduct2", newProduct2);*/
		
		
		
		
		//获取用户购物车
		Boolean existUser = CommonUtil.isExistUser(ServletActionContext.getRequest());
		if(existUser){
			Account account = accountService.findAccount((Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount"));
			List<CartInfo> thereCartInfo = cartService.getThereCartInfo(account.getId());
			ActionContext.getContext().getValueStack().set("cartInfos", thereCartInfo);
		}else{
			ActionContext.getContext().getValueStack().set("cartNull", "购物车为空！");
		}
		
		
		System.out.println(pid);
		AnimeProduct product = animeProductService.getProductById(pid);
		ActionContext.getContext().getValueStack().set("product", product);
		return "singleDetail";
	}
	

	
	
}
