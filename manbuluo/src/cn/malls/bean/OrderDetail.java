package cn.malls.bean;

public class OrderDetail {
	private Integer id;
//	private Integer orderInfoId;
	private Integer productId;
	private String name;
	private String image;
	private String color;
	private String size;
	private Integer quantity;
	private Double subtotal;
	private Double market_price;
	private Double present_price;
	
	private OrderInfo orderInfo;
	
	public OrderInfo getOrderInfo() {
		return orderInfo;
	}

	public void setOrderInfo(OrderInfo orderInfo) {
		this.orderInfo = orderInfo;
	}

	public Integer getId() {
		return id;
	}
	
	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setId(Integer id) {
		this.id = id;
	}
/*	public Integer getOrderInfoId() {
		return orderInfoId;
	}
	public void setOrderInfoId(Integer orderInfoId) {
		this.orderInfoId = orderInfoId;
	}*/
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	public Double getMarket_price() {
		return market_price;
	}
	public void setMarket_price(Double market_price) {
		this.market_price = market_price;
	}
	public Double getPresent_price() {
		return present_price;
	}
	public void setPresent_price(Double present_price) {
		this.present_price = present_price;
	}
	
}
