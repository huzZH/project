package cn.malls.service.imp;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.malls.bean.OrderInfo;
import cn.malls.dao.OrderDao;
import cn.malls.service.OrderService;
@Service
@Transactional
public class OrderServiceImp implements OrderService{
	@Resource
	private OrderDao orderDao;

	@Override
	public void saveOrder(OrderInfo orderInfo) {
		// TODO Auto-generated method stub
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyMMddSSmmssSSS");
		Random rd = new Random();
		String orderNumber = sdf.format(new Date()) + rd.nextInt(10000);
		orderInfo.setOrderNumber(orderNumber);
		orderInfo.setOrderStatus((byte)0);
		
		orderDao.saveOrder(orderInfo);
	}
	/**
	 * 根据订单号查找订单
	 */
	@Override
	public OrderInfo findByOrderNumber(String orderNumber) {
		// TODO Auto-generated method stub
		
		return orderDao.findByOrderNumber(orderNumber);
	}
	/**
	 * 修改订单状态
	 */
	@Override
	public void update(OrderInfo orderInfo) {
		// TODO Auto-generated method stub
		orderDao.update(orderInfo);
	}
	@Override
	public List<OrderInfo> findMyOrder(Integer accountId) {
		// TODO Auto-generated method stub
		return orderDao.findMyOrder(accountId);
	}
}
