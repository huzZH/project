package cn.malls.bean;

import java.util.HashSet;
import java.util.Set;

public class AnimeRegion {
	private Integer id;
	private String name;
	private String image;
//	private List<AnimeName> animeNames = new ArrayList<AnimeName>();
	
	private Set<AnimeName> animeNames = new HashSet<AnimeName>();
	

	public Set<AnimeName> getAnimeNames() {
		return animeNames;
	}
	public void setAnimeNames(Set<AnimeName> animeNames) {
		this.animeNames = animeNames;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}
