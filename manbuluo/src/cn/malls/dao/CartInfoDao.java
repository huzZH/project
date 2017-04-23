package cn.malls.dao;

import java.util.List;

import cn.malls.bean.CartInfo;

public interface CartInfoDao {
	//
	public void saveCartInfo(CartInfo cartInfo);
	//
	public void deleteSingleCart(CartInfo cartInfo);
	//
	public CartInfo getCartInfoById(Integer cartInfoId);
	//
	public void deleteListCart(List listId);
	//
	public List<CartInfo> getCartInfoList(List listId);
	
}
