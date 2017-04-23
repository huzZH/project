package cn.malls.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class OrderInfo {
	private Integer id;
	private String orderNumber;   //订单号
	private Integer accountId;    //账号ID
	private String consignee;     //收货人
	private String mobil;         //手机号
	private String address;       //收货地址
	private String payType;		  //支付方式
	private Byte payStatus;       //支付状态
	private Byte orderStatus;	  //订单状态
	private Double totalAmount;	  //总金额
	private String IP;			  //地址IP
	private String postCode;	  //邮编
	private Date addTime;		  //下单时间
	private Date payTime;		  //支付时间
	private Integer returnOid;    //退货单号
	private Integer exchangeOid;  //换货单号
	private String note;		  //备注
	
	private Set<OrderDetail> orderDetails = new HashSet<OrderDetail>();//订单子表《一对多的关系》

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public String getConsignee() {
		return consignee;
	}

	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}

	public String getMobil() {
		return mobil;
	}

	public void setMobil(String mobil) {
		this.mobil = mobil;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public Byte getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(Byte payStatus) {
		this.payStatus = payStatus;
	}

	public Byte getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Byte orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getIP() {
		return IP;
	}

	public void setIP(String iP) {
		IP = iP;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public Date getPayTime() {
		return payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}

	public Integer getReturnOid() {
		return returnOid;
	}

	public void setReturnOid(Integer returnOid) {
		this.returnOid = returnOid;
	}

	public Integer getExchangeOid() {
		return exchangeOid;
	}

	public void setExchangeOid(Integer exchangeOid) {
		this.exchangeOid = exchangeOid;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
	
	
	
	
}
