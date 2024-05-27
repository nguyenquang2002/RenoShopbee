package com.devpro.javaweb21ExampleDay01.controller.administrator;

import java.io.IOException;
import java.util.HashMap;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb21ExampleDay01.controller.BaseController;
import com.devpro.javaweb21ExampleDay01.dto.ProductSearchModel;
import com.devpro.javaweb21ExampleDay01.model.Product;
import com.devpro.javaweb21ExampleDay01.services.PagerData;
import com.devpro.javaweb21ExampleDay01.services.ProductsService;

@Controller
public class AdminProductController extends BaseController{
	@Autowired
	private ProductsService productsService;

	
	
	@RequestMapping(value = { "/admin/product" }, method = RequestMethod.GET)
	public String adminProduct(final Model model,
							   final HttpServletRequest request,
							   final HttpServletResponse response) {
		
		String keyword = request.getParameter("keyword");
		Integer categoryId = getInteger(request, "categoryId");

		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.setKeyword(keyword);
		searchModel.setCategoryId(categoryId);
		searchModel.setPage(getCurrentPage(request));
		
		PagerData<Product> products = productsService.search(searchModel);
		
		model.addAttribute("products", products);
		model.addAttribute("searchModel", searchModel);
		
		return "/administrator/products"; // -> /WEB-INF/views/administrator/home.jsp
	}
	
	@RequestMapping(value = { "/admin/product/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody Product product) {
		
		Product productInDb = productsService.getById(product.getId());
		productInDb.setStatus(false);
		productsService.saveOrUpdate(productInDb);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
	
	@RequestMapping(value = { "/admin/product/management" }, method = RequestMethod.GET)
	public String adminManageProduct(final Model model,
					  final HttpServletRequest request,
					  final HttpServletResponse response) {
		
		Product data = new Product();
		model.addAttribute("product", data);
		
		
		
		return "/administrator/product_management"; // -> /WEB-INF/views/administrator/home.jsp
	}
	

	@RequestMapping(value = { "/admin/product/management" }, method = RequestMethod.POST)
	public String adminManagementProductPost(final Model model,
											 final HttpServletRequest request,
											 final HttpServletResponse response,
											 final @ModelAttribute("product") Product product,
											 final @RequestParam("productAvatar") MultipartFile productAvatar,
											 final @RequestParam("productPictures") MultipartFile[] productPictures)throws Exception {
		
		
		if(product.getId() == null || product.getId() < 0 ) {
			productsService.add(product, productAvatar, productPictures);
		}
		else {
			productsService.update(product, productAvatar, productPictures);
		}
		
		
		return "redirect:/admin/product"; 
	}
	
	@RequestMapping(value = { "/admin/product/management/{productID}"}, method = RequestMethod.GET)
	public String adminProductEdit(final Model model,
								   final HttpServletRequest request,
								   final HttpServletResponse response,
								   @PathVariable("productID") int productID) throws IOException{
		
		// lấy product theo id
		Product productInDatabase = productsService.getById(productID);
		model.addAttribute("product", productInDatabase);
		
		
		
		return "/administrator/product_management";						   
	}
}
