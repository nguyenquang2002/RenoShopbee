package com.devpro.javaweb21ExampleDay01.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_category")
public class Category extends BaseEntity{
	@Column(name = "name", length = 100, nullable = false)
	private String name;
	
	@Column(name = "description", length = 100, nullable = false)
	private String description;
	
	@OneToMany(cascade = CascadeType.ALL,
			   fetch = FetchType.LAZY,
			   mappedBy = "categories") // trỏ tới property
	private Set<Product> products = new HashSet<Product>();
	// bất cứ ở quan hệ OneToMany cần thêm 2 hàm add và delete
	public void addProduct(Product product) {
		products.add(product);
		product.setCategories(this);
	}
	public Set<Product> getProducts() {
		return products;
	}
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	public void deleteProduct(Product product) {
		products.remove(product);
		product.setCategories(null);
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
