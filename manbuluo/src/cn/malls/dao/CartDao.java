package cn.malls.dao;

import java.util.List;

import cn.malls.bean.Cart;
import cn.malls.bean.CartInfo;

public interface CartDao {
	//
	public Cart findCartByAccountId(Integer accountId);
	//
	public Cart createCart(Cart cart);
	//
	public List<CartInfo> getThereCartInfo(Integer accountId);
	//
	public List<Cart> getUserCart(Integer cartId);

}
