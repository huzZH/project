package cn.malls.service;

import java.util.List;

import cn.malls.bean.CartInfo;

public interface CartInfoService {
	//
	public void saveCartInfo(CartInfo cartInfo, Integer accountId);
	//
	public void deleteSingleCart(CartInfo cartInfo);
	//
	public CartInfo getCartInfoById(Integer cartInfoId);
	//
	public void deleteListCart(List listId);
	//
	public List<CartInfo> getCartInfoList(List<CartInfo> list);


}
