package com.devpro.javaweb21ExampleDay01.dto;

public class UserSearchModel extends BaseSearchModel{
	// tìm theo keyword
	private String keyword;

	// tìm theo role
	private Integer roleId;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	
	
}
