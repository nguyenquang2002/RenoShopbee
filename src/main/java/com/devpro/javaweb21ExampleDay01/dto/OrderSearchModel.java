package com.devpro.javaweb21ExampleDay01.dto;

public class OrderSearchModel extends BaseSearchModel{
	// tìm theo keyword
	private String keyword;

	// tìm theo status
	private Integer orderStatus;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
}
