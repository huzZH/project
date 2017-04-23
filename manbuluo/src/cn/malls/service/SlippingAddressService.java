package cn.malls.service;

import java.util.List;

import cn.malls.bean.SlippingAddress;

public interface SlippingAddressService {
	//
	public List<SlippingAddress> getSlipAddress(Integer accountId);
	//
	public void saveSlipAddress(SlippingAddress slipAddress);
	//
	public SlippingAddress findSlipAddressById(Integer id, Integer accountId);
	//
	public void update(SlippingAddress sa);
	//
	public List<SlippingAddress> findSlipAddress(Integer accountId);
	//
	public void delete(SlippingAddress slipAddress);
	
	
}
