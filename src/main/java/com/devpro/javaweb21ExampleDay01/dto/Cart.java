package com.devpro.javaweb21ExampleDay01.dto;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * biểu thị cho giỏ hàng
 * @author daing
 *
 */
public class Cart {

	// tổng số tiền trong giỏ hàng
	private BigDecimal totalPrice = BigDecimal.ZERO;
	
	private Integer totalProducts = 0;
	
	// danh sách sản phẩm trong giỏ hàng
	private List<CartItem> cartItems = new ArrayList<CartItem>();
	
	public CartItem getCartItemById(int id) {
		CartItem cartItem = null;
		for (CartItem ci : cartItems) {
			if(id==ci.getProductId()) {
				cartItem.setAvatar(ci.getAvatar());
				cartItem.setPriceUnit(ci.getPriceUnit());
				cartItem.setProductId(ci.getProductId());
				cartItem.setProductName(ci.getProductName());
				cartItem.setQuanlity(ci.getQuanlity());
			}
		}
		return cartItem;
	}
	
	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Integer getTotalProducts() {
		return totalProducts;
	}

	public void setTotalProducts(Integer totalProducts) {
		this.totalProducts = totalProducts;
	}
	
}
