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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21ExampleDay01.controller.BaseController;
import com.devpro.javaweb21ExampleDay01.dto.OrderSearchModel;
import com.devpro.javaweb21ExampleDay01.model.SaleOrder;
import com.devpro.javaweb21ExampleDay01.services.PagerData;
import com.devpro.javaweb21ExampleDay01.services.SaleOrderService;


@Controller
public class AdminOrderController extends BaseController{
	@Autowired
	SaleOrderService orderService = new SaleOrderService();
	
	@RequestMapping(value = { "/admin/order" }, method = RequestMethod.GET)
	public String adminOrder(final Model model,
							   final HttpServletRequest request,
							   final HttpServletResponse response) {
		
		String keyword = request.getParameter("keyword");
		Integer orderStatus = getInteger(request, "orderStatus");
		
		OrderSearchModel searchModel = new OrderSearchModel();
		searchModel.setKeyword(keyword);
		searchModel.setOrderStatus(orderStatus);
		searchModel.setPage(getCurrentPage(request));
		
		PagerData<SaleOrder> orders = orderService.search(searchModel);
		
		model.addAttribute("orders", orders);
		model.addAttribute("searchModel", searchModel);
		
		return "/administrator/orders"; // -> /WEB-INF/views/administrator/home.jsp
	}
	
	@RequestMapping(value = { "/admin/order/detail/{orderID}"}, method = RequestMethod.GET)
	public String adminOrderEdit(final Model model,
								   final HttpServletRequest request,
								   final HttpServletResponse response,
								   @PathVariable("orderID") int orderID) throws IOException{
		
		// lấy product theo id
		SaleOrder order = orderService.getById(orderID);
		model.addAttribute("order", order);
		
		
		
		return "/administrator/order_detail";						   
	}
	
	@RequestMapping(value = { "/admin/order/cancel" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> cancelOrder(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody SaleOrder order) {
		
		SaleOrder orderInDB = orderService.getById(order.getId());
		orderInDB.setOrderStatus(0);
		orderService.saveOrUpdate(orderInDB);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã hủy thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
	
	@RequestMapping(value = { "/admin/order/accept" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> acceptOrder(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody SaleOrder order) {
		
		SaleOrder orderInDB = orderService.getById(order.getId());
		orderInDB.setOrderStatus(2);
		orderService.saveOrUpdate(orderInDB);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã hủy thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
	
	@RequestMapping(value = { "/admin/order/complete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> completeOrder(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody SaleOrder order) {
		
		SaleOrder orderInDB = orderService.getById(order.getId());
		orderInDB.setOrderStatus(3);
		orderService.saveOrUpdate(orderInDB);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã hủy thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
}