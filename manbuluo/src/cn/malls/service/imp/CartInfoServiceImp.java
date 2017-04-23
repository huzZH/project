package cn.malls.service.imp;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.malls.bean.Cart;
import cn.malls.bean.CartInfo;
import cn.malls.dao.CartDao;
import cn.malls.dao.CartInfoDao;
import cn.malls.service.CartInfoService;

@Service
public class CartInfoServiceImp implements CartInfoService{
	@Resource
	private CartInfoDao cartInfoDao;
	@Resource
	private CartDao cartDao;
	
	/**
	 * 1、首先根据accountID判断用户是否存在购物车
	 * 		若没有，则创建，
	 * 		若有，则让子购物车保存购物车的ID
	 */
	@Override
	public void saveCartInfo(CartInfo cartInfo, Integer accountId) {
		// TODO Auto-generated method stub
		cartInfo.setAddTime(new Date());//子购物车创建时间
		//根据账号ID来查找购物车
		Cart exitCart = cartDao.findCartByAccountId(accountId);
//		Cart exitCart = null;
		//未找到购物车则创建
		if(exitCart == null){
			Cart newCart = new Cart();
			newCart.setAccountId(accountId);
			exitCart = cartDao.createCart(newCart);
		}
		cartInfo.setCartId(exitCart.getId());
		System.out.println(exitCart.getId());
		cartInfoDao.saveCartInfo(cartInfo);
	}

	@Override
	public void deleteSingleCart(CartInfo cartInfo) {
		// TODO Auto-generated method stub
		cartInfoDao.deleteSingleCart(cartInfo);
	}

	@Override
	public CartInfo getCartInfoById(Integer cartInfoId) {
		// TODO Auto-generated method stub
		
		return cartInfoDao.getCartInfoById(cartInfoId);
	}
	//批量删除购物车信息
	@Override
	public void deleteListCart(List listId) {
		// TODO Auto-generated method stub
		cartInfoDao.deleteListCart(listId);
	}
	/*
	 * (non-Javadoc)
	 * @see cn.malls.service.CartInfoService#getCartInfoList(java.util.List)
	 */
	@Override
	public List<CartInfo> getCartInfoList(List<CartInfo> list) {
		// TODO Auto-generated method stub
		List listId = new ArrayList();
		for(int i = 0; i < list.size(); i++) {
			listId.add(list.get(i).getId());
		}
		List<CartInfo> cartInfoList = cartInfoDao.getCartInfoList(listId);
		return cartInfoList;
	}
	



}
