package cn.malls.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class AnimeProduct implements Serializable{
	private Integer id;
	private String name;
	private Double discount;
	private Long number;
	private String image;
	private String describe;
	private Integer animeName_id;
	private Integer animeCategory_id;
	private Byte isHot;
	private Byte isNew;
	
	private Set<ProductPrice> productPrices = new HashSet<ProductPrice>();
	
	
//	private List<ProductPrice> productPrices = new ArrayList<ProductPrice>();
	


	public Integer getAnimeName_id() {
		return animeName_id;
	}
	public Set<ProductPrice> getProductPrices() {
		return productPrices;
	}
	public void setProductPrices(Set<ProductPrice> productPrices) {
		this.productPrices = productPrices;
	}
	public void setAnimeName_id(Integer animeName_id) {
		this.animeName_id = animeName_id;
	}
	public Integer getAnimeCategory_id() {
		return animeCategory_id;
	}
	public void setAnimeCategory_id(Integer animeCategory_id) {
		this.animeCategory_id = animeCategory_id;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public Long getNumber() {
		return number;
	}
	public void setNumber(Long number) {
		this.number = number;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public Byte getIsHot() {
		return isHot;
	}
	public void setIsHot(Byte isHot) {
		this.isHot = isHot;
	}
	public Byte getIsNew() {
		return isNew;
	}
	public void setIsNew(Byte isNew) {
		this.isNew = isNew;
	}

	
}
