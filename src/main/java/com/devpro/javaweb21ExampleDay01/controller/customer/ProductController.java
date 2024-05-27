package com.devpro.javaweb21ExampleDay01.controller.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21ExampleDay01.controller.BaseController;
import com.devpro.javaweb21ExampleDay01.dto.ProductSearchModel;
import com.devpro.javaweb21ExampleDay01.model.Product;
import com.devpro.javaweb21ExampleDay01.services.PagerData;
import com.devpro.javaweb21ExampleDay01.services.ProductsService;

@Controller
public class ProductController extends BaseController{
	
	@Autowired
	private ProductsService productsService;
	
	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public String list(final Model model,
					   final HttpServletRequest request,
					   final HttpServletResponse response) {
		
		

		String keyword = request.getParameter("keyword");
		String price = request.getParameter("price");
		String size = request.getParameter("size");
		String color = request.getParameter("color");
		Integer categoryId = getInteger(request, "categoryId");
		

		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.setKeyword(keyword);
		searchModel.setCategoryId(categoryId);
		searchModel.setPrice(price);
		searchModel.setSize(size);
		searchModel.setColor(color);
		searchModel.setPage(getCurrentPage(request));
		
		PagerData<Product> products = productsService.search(searchModel);
		
		model.addAttribute("products", products);
		model.addAttribute("searchModel", searchModel);
		
		return "/customer/listproduct";
	}

	
	@RequestMapping(value = { "/infor-product/{productName}-{productID}" }, method = RequestMethod.GET)
	public String infor(final Model model,
					  	final HttpServletRequest request,
					  	final HttpServletResponse response,
					  	@PathVariable("productID") int productID) {
		
		Product productInDatabase = productsService.getById(productID);
		model.addAttribute("product", productInDatabase);
		
		List<Product> products_hot = productsService.getEntitiesByNativeSQL("select * from tbl_products where is_hot = 1 and status = 1 limit 4");
		model.addAttribute("products_hot", products_hot);
		return "/customer/inforproduct";
	}
}
