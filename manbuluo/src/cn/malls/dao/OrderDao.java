package cn.malls.dao;

import java.util.List;

import cn.malls.bean.OrderDetail;
import cn.malls.bean.OrderInfo;

public interface OrderDao {
	//
	public void saveOrderItem(List<OrderDetail> orderItem);
	//
	public void saveOrder(OrderInfo orderInfo);
	//
	public OrderInfo findByOrderNumber(String orderNumber);
	//
	public void update(OrderInfo orderInfo);
	//
	public List<OrderInfo> findMyOrder(Integer accountId);
}
