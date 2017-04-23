package cn.malls.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Cart {
	private Integer id;
	private Integer accountId;
	private Integer totalQuantity;
	private Double totalPrice;
	private Date addTime;
	
	private Set<CartInfo> cartInfos = new HashSet<CartInfo>();
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAccountId() {
		return accountId;
	}
	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}
	public Integer getTotalQuantity() {
		return totalQuantity;
	}
	public void setTotalQuantity(Integer totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	public Set<CartInfo> getCartInfos() {
		return cartInfos;
	}
	public void setCartInfos(Set<CartInfo> cartInfos) {
		this.cartInfos = cartInfos;
	}
	
	
}	
