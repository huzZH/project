package cn.malls.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.malls.bean.Cart;
import cn.malls.bean.CartInfo;
import cn.malls.dao.CartDao;
import cn.malls.service.CartService;
@Service
public class CartServiceImp implements CartService{
	
	@Resource
	private CartDao cartDao;

	@Override
	public List<CartInfo> getThereCartInfo(Integer accountId) {
		// TODO Auto-generated method stub
		//根据账号ID来查找购物车
		Cart exitCart = cartDao.findCartByAccountId(accountId);
		//未找到购物车则创建
		if(exitCart == null){
			Cart newCart = new Cart();
			newCart.setAccountId(accountId);
			exitCart = cartDao.createCart(newCart);
		}else {
			return cartDao.getThereCartInfo(accountId);
		}
		return null;
	}

	@Override
	public List<Cart> getUserCart(Integer cartId) {
		// TODO Auto-generated method stub
		return cartDao.getUserCart(cartId);
	}
	
}
