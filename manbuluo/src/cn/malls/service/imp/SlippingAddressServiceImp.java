package cn.malls.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.malls.bean.SlippingAddress;
import cn.malls.dao.SlippingAddressDao;
import cn.malls.service.SlippingAddressService;
@Service
public class SlippingAddressServiceImp implements SlippingAddressService{
	
	@Resource
	private SlippingAddressDao slippingAddressDao;
	@Override
	public List<SlippingAddress> getSlipAddress(Integer accountId) {
		// TODO Auto-generated method stub
		return slippingAddressDao.getSlipAddress(accountId);
	}
	@Override
	public void saveSlipAddress(SlippingAddress slipAddress) {
		// TODO Auto-generated method stub
		slippingAddressDao.saveSlipAddress(slipAddress);
	}
	@Override
	public SlippingAddress findSlipAddressById(Integer id, Integer accountId) {
		// TODO Auto-generated method stub
		return slippingAddressDao.findSlipAddressById(id, accountId);
	}
	@Override
	public void update(SlippingAddress sa) {
		// TODO Auto-generated method stub
		slippingAddressDao.update(sa);
	}
	@Override
	public List<SlippingAddress> findSlipAddress(Integer accountId) {
		// TODO Auto-generated method stub
		return slippingAddressDao.findSlipAddress(accountId);
	}
	@Override
	public void delete(SlippingAddress slipAddress) {
		// TODO Auto-generated method stub
		slippingAddressDao.delete(slipAddress);
	}

}
