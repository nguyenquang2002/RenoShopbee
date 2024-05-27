package com.devpro.javaweb21ExampleDay01.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.javaweb21ExampleDay01.model.Category;
import com.devpro.javaweb21ExampleDay01.model.Product;
import com.devpro.javaweb21ExampleDay01.model.User;
import com.devpro.javaweb21ExampleDay01.services.CategoriesService;
import com.devpro.javaweb21ExampleDay01.services.ProductsService;

public class BaseController {
	
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private ProductsService productsService;
	

	
	@ModelAttribute("categories")
	public List<Category> getAllCategories(){
		return categoriesService.findAll();
	}
	
	@ModelAttribute("access_count")
	public int accessoryCount() {
		List<Product> products = productsService.getEntitiesByNativeSQL("select * from tbl_products as p where p.status=1");
		int count = 0;
		for (Product p : products) {
			if(p.getCategories().getId()==1) {
				count++;
			}
		}
		return count;
		
	}
	
	@ModelAttribute("jewel_count")
	public int jewelCount() {
		List<Product> products = productsService.getEntitiesByNativeSQL("select * from tbl_products as p where p.status=1");
		int count = 0;
		for (Product p : products) {
			if(p.getCategories().getId()==2) {
				count++;
			}
		}
		return count;
		
	}
	
	@ModelAttribute("watch_count")
	public int watchCount() {
		List<Product> products = productsService.getEntitiesByNativeSQL("select * from tbl_products as p where p.status=1");
		int count = 0;
		for (Product p : products) {
			if(p.getCategories().getId()==6) {
				count++;
			}
		}
		return count;
		
	}
	@ModelAttribute("clothing_count")
	public int clothingCount() {
		List<Product> products = productsService.getEntitiesByNativeSQL("select * from tbl_products as p where p.status=1");
		int count = 0;
		for (Product p : products) {
			if(p.getCategories().getId()==7) {
				count++;
			}
		}
		return count;
		
	}
	@ModelAttribute("bag_count")
	public int bagCount() {
		List<Product> products = productsService.getEntitiesByNativeSQL("select * from tbl_products as p where p.status=1");
		int count = 0;
		for (Product p : products) {
			if(p.getCategories().getId()==8) {
				count++;
			}
		}
		return count;
		
	}
	
	/**
	 * Kiểm tra xem người dùng đã đăng nhập chưa?
	 * User logined có thể truy cập thông qua class SecurityContextHolder
	 * @return true|false, true nếu đã login ngược lại trả về false
	 */
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			isLogined = true;
		}
		
		return isLogined;
	}
	
	/**
	 * trả về entity User chính là user logined
	 * User logined có thể truy cập thông qua class SecurityContextHolder
	 * @return
	 */
	@ModelAttribute("userLogined")
	public User getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails)
			return (User) userLogined;
		
		return new User();
	}
	
	
	public Integer getInteger(HttpServletRequest request, String paramName) {
		try {
			return Integer.parseInt(request.getParameter(paramName));
		} catch (Exception e) {
			return null;
		}
	}
	
	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}
}
