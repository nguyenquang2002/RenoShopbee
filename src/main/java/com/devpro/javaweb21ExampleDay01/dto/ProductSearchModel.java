package com.devpro.javaweb21ExampleDay01.dto;

public class ProductSearchModel extends BaseSearchModel {
	// tìm theo keyword
	private String keyword;

	// tìm theo category
	private Integer categoryId;
	
	// price
	private String price;
	
	private String size;

	private String color;
	
	

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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
}
