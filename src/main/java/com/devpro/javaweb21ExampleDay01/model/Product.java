package com.devpro.javaweb21ExampleDay01.model;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "tbl_products")
public class Product extends BaseEntity{
	@Column(name = "name", length = 1000, nullable = false)
	private String name;
	
	@Lob
	@Column(name = "description", nullable = false, columnDefinition = "LONGTEXT")
	private String desc;
	
	@Lob
	@Column(name = "detail", nullable = false, columnDefinition = "LONGTEXT")
	private String detail;
	
	@Column(name = "price", precision = 13, scale = 2, nullable = false)
	private BigDecimal price;

	@Column(name = "price_sale", precision = 13, scale = 2, nullable = true)
	private BigDecimal priceSale;
	
	@Column(name = "money_unit", length = 45, nullable = false)
	private String moneyUnit;
	
	@Column(name = "size", length = 45, nullable = false)
	private String size;

	@Column(name = "color", length = 45, nullable = false)
	private String color;

	@Column(name = "amount", nullable = false)
	private int amount;
	
	@Column(name = "status", nullable = true)
	private Boolean status = Boolean.TRUE;
	
	@Column(name = "seo", length = 1000, nullable = false)
	private String seo;
	
	@Column(name = "is_hot", nullable = true)
	private Boolean isHot = Boolean.FALSE;
	
	@Column(name = "avatar", nullable = true)
	private String avatar;
	
	@OneToMany(cascade = CascadeType.ALL, 
			   fetch = FetchType.EAGER, 
			   mappedBy = "product")
	private Set<ProductImages> productImages = new HashSet<ProductImages>();
	public void addProductImages(ProductImages _productImages) {
		_productImages.setProduct(this);
		productImages.add(_productImages);
	}
	public void deleteProductImages(ProductImages _productImages) {
		_productImages.setProduct(null);
		productImages.remove(_productImages);
	}

	public Set<ProductImages> getProductImages() {
		return productImages;
	}
	public void setProductImages(Set<ProductImages> productImages) {
		this.productImages = productImages;
	}
	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id") // tên foreign key
	private Category categories;

	public Category getCategories() {
		return categories;
	}

	public void setCategories(Category categories) {
		this.categories = categories;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(BigDecimal priceSale) {
		this.priceSale = priceSale;
	}


	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getMoneyUnit() {
		return moneyUnit;
	}

	public void setMoneyUnit(String moneyUnit) {
		this.moneyUnit = moneyUnit;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	
	
}
