package cn.malls.bean;

import java.io.Serializable;

public class ProductPrice implements Serializable{	
	private Integer id;
	private AnimeProduct animeProduct;
	private ProductColor productColor;
	private ProductSize productSize;
	private Double market_price;
	private Double present_price;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public AnimeProduct getAnimeProduct() {
		return animeProduct;
	}
	public void setAnimeProduct(AnimeProduct animeProduct) {
		this.animeProduct = animeProduct;
	}
	public ProductColor getProductColor() {
		return productColor;
	}
	public void setProductColor(ProductColor productColor) {
		this.productColor = productColor;
	}
	public ProductSize getProductSize() {
		return productSize;
	}
	public void setProductSize(ProductSize productSize) {
		this.productSize = productSize;
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
