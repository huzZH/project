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
	 * 1�����ȸ���accountID�ж��û��Ƿ���ڹ��ﳵ
	 * 		��û�У��򴴽���
	 * 		���У������ӹ��ﳵ���湺�ﳵ��ID
	 */
	@Override
	public void saveCartInfo(CartInfo cartInfo, Integer accountId) {
		// TODO Auto-generated method stub
		cartInfo.setAddTime(new Date());//�ӹ��ﳵ����ʱ��
		//�����˺�ID�����ҹ��ﳵ
		Cart exitCart = cartDao.findCartByAccountId(accountId);
//		Cart exitCart = null;
		//δ�ҵ����ﳵ�򴴽�
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
	//����ɾ�����ﳵ��Ϣ
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
