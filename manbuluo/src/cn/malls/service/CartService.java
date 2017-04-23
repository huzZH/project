package cn.malls.service;

import java.util.List;

import cn.malls.bean.Cart;
import cn.malls.bean.CartInfo;

public interface CartService {
	//
	public List<CartInfo> getThereCartInfo(Integer accountId);
	//
	public List<Cart> getUserCart(Integer cartId);
}
