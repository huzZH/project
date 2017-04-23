package cn.malls.bean;

import java.util.Date;

public class AnimeName {
	private Integer id;
	private String name;
	private Date createDate;
	private Date deleteDate;
	private AnimeRegion animeRegion;
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
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getDeleteDate() {
		return deleteDate;
	}
	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}
	public AnimeRegion getAnimeRegion() {
		return animeRegion;
	}
	public void setAnimeRegion(AnimeRegion animeRegion) {
		this.animeRegion = animeRegion;
	}
	
}
