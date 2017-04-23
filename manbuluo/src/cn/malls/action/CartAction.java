package cn.malls.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.malls.bean.Account;
import cn.malls.bean.AnimeCategory;
import cn.malls.bean.AnimeRegion;
import cn.malls.bean.Cart;
import cn.malls.bean.CartInfo;
import cn.malls.service.AccountService;
import cn.malls.service.AnimeCategoryService;
import cn.malls.service.AnimeProductService;
import cn.malls.service.AnimeRegionService;
import cn.malls.service.CartInfoService;
import cn.malls.service.CartService;
import cn.malls.web.CommonUtil;
@Controller
public class CartAction extends ActionSupport implements ModelDriven<CartInfo>{
	//
	@Autowired
	private AnimeRegionService animeRegionService;
	@Autowired
	private AnimeCategoryService animeCategoryService;
	@Autowired
	private AnimeProductService animeProductService;
	@Autowired
	private CartInfoService cartInfoService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private CartService cartService;
	
	
	private CartInfo cartInfo = new CartInfo();
	@Override
	public CartInfo getModel() {
		// TODO Auto-generated method stub
		return cartInfo;
	}
	//
	private Integer pid;
	private Integer cid;
	private Integer cartInfoId;
	private String listCartInfoId;
	

	

	
	
	

	


	public String getListCartInfoId() {
		return listCartInfoId;
	}
	public void setListCartInfoId(String listCartInfoId) {
		this.listCartInfoId = listCartInfoId;
	}
	public Integer getCartInfoId() {
		return cartInfoId;
	}
	public void setCartInfoId(Integer cartInfoId) {
		this.cartInfoId = cartInfoId;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	/*
	 * 
	 */
	public String addCart()throws Exception{
		//获取导航条
		List<AnimeRegion> list = animeRegionService.getAnimeRegion();
		//获取分类
		List<AnimeCategory> animeCategorys = animeCategoryService.getAnimeCategory();

		ActionContext.getContext().getValueStack().set("animeNav", list);
		ActionContext.getContext().getValueStack().set("animeCategorys", animeCategorys);

		
		
		Account existAccount = (Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount");
		if(existAccount == null){
			ActionContext.getContext().getValueStack().set("errorMessage", "请先登录！");
			return "input";
		}
		Account account = accountService.findAccount(existAccount);
		cartInfoService.saveCartInfo(cartInfo, account.getId());
		
		List<CartInfo> thereCartInfo = cartService.getThereCartInfo(account.getId());
		ActionContext.getContext().getValueStack().set("cartInfos", thereCartInfo);
		
		ActionContext.getContext().getValueStack().set("cartInfo", cartInfo);
		
		
		return "addCartSuccess";
	}
	/*
	 * 进入我的购物车
	 */
	public String myCart() throws Exception {
		
		//获取导航条
		List<AnimeRegion> list = animeRegionService.getAnimeRegion();
		//获取分类
		List<AnimeCategory> animeCategorys = animeCategoryService.getAnimeCategory();
		
	
		//获取用户购物车
		Boolean existUser = CommonUtil.isExistUser(ServletActionContext.getRequest());
		if(existUser){
			Account account = accountService.findAccount((Account) ServletActionContext.getRequest().getSession().getAttribute("existAccount"));
			List<CartInfo> thereCartInfo = cartService.getThereCartInfo(account.getId());
			ActionContext.getContext().getValueStack().set("cartInfos", thereCartInfo);
		}else{
			ActionContext.getContext().getValueStack().set("cartNull", "购物车为空！");
		}
		
		ActionContext.getContext().getValueStack().set("animeNav", list);
		ActionContext.getContext().getValueStack().set("animeCategorys", animeCategorys);

		if(existUser) {
			List<Cart> carts = cartService.getUserCart(cid);
			ActionContext.getContext().getValueStack().set("carts", carts);
			return "myCart";
		}
		ActionContext.getContext().getValueStack().set("errorMessage", "请先登录！");
		return "input";
	}
	/*
	 * 删除单个购物信息
	 */
	public void deleteSingleCart() throws Exception {
		Boolean existUser = CommonUtil.isExistUser(ServletActionContext.getRequest());
		if(existUser) {
			CartInfo cartInfo = cartInfoService.getCartInfoById(cartInfoId);
			if(cartInfo != null){
				cartInfoService.deleteSingleCart(cartInfo);
			}else {
				JSONObject json = new JSONObject();
				json.put("message", "该商品已删除！");
				ServletActionContext.getResponse().setCharacterEncoding("utf-8");
				ServletActionContext.getResponse().getWriter().write(json.toString());
			}
		}else {
			ActionContext.getContext().getValueStack().set("errorMessage", "请先登录！");
			ServletActionContext.getResponse().sendRedirect("accountAction_login.action");
			/*ServletActionContext.getRequest().getRequestDispatcher("accountAction_login.action")
			.forward(ServletActionContext.getRequest(), ServletActionContext.getResponse());*/
		}

	}
	/*
	 * 删除多个购物信息
	 */
	public void deleteListCart() throws Exception {
		Boolean existUser = CommonUtil.isExistUser(ServletActionContext.getRequest());
		if(existUser) {
			String[] str = listCartInfoId.split(",");
			List listId = new ArrayList();
			for(int i = 0; i < str.length; i++) {
				listId.add(str[i]);
			}
			
			cartInfoService.deleteListCart(listId);
		}
	}
	
	
	
}
