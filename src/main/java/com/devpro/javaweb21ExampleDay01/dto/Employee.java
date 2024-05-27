package com.devpro.javaweb21ExampleDay01.dto;

public class Employee {
	
	private Integer id;	// property: có get set
	private String name;
	
	
	
	public Employee(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
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
	
}
