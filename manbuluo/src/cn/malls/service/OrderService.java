package cn.malls.service;

import java.util.List;

import cn.malls.bean.OrderInfo;

public interface OrderService {
	//
	public void saveOrder(OrderInfo orderInfo);
	//
	public OrderInfo findByOrderNumber(String orderNumber);
	//
	public void update(OrderInfo orderInfo);
	//
	public List<OrderInfo> findMyOrder(Integer accountId);
}
