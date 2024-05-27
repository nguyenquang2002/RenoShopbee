package com.devpro.javaweb21ExampleDay01.controller.customer;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21ExampleDay01.controller.BaseController;
import com.devpro.javaweb21ExampleDay01.dto.Subscribe;
import com.devpro.javaweb21ExampleDay01.model.Product;
import com.devpro.javaweb21ExampleDay01.model.Role;
import com.devpro.javaweb21ExampleDay01.model.SaleOrder;
import com.devpro.javaweb21ExampleDay01.model.User;
import com.devpro.javaweb21ExampleDay01.services.ProductsService;
import com.devpro.javaweb21ExampleDay01.services.RoleService;
import com.devpro.javaweb21ExampleDay01.services.SaleOrderService;
import com.devpro.javaweb21ExampleDay01.services.UserService;


// 1. Báo cho Spring MVC biết đây là controller
// 2. Tạo instance của controller này <=> HomeController hc = new HomeController();
// hc được lưu vào spring-container(kiểu dữ liệu list, map)
@Controller
public class HomeController extends BaseController{
	
	@Autowired
	ProductsService productsService = new ProductsService();
	@Autowired
	UserService userService = new UserService();
	@Autowired
	RoleService roleService = new RoleService();
	@Autowired
	SaleOrderService orderService = new SaleOrderService();
	
	/* @param model
	 * @param request
	 * @param response
	 * @return
	 * 
	 */
	
	// Tạo request /home
	@RequestMapping(value = { "/home" }, method = RequestMethod.GET)
	public String home(final Model model,
					   final HttpServletRequest request,
					   final HttpServletResponse response) {
		
//		// tạo giỏ hàng
//		Cart cart = createCart();
//		
//		// lưu giỏ hàng lên session
//		HttpSession session = request.getSession();
//		session.setAttribute("cart", cart);
//		
//		ArrayList<Employee> employees = new ArrayList<Employee>();
//		employees.add(new Employee(1, "Nguyễn Văn A"));
//		employees.add(new Employee(2, "Nguyễn Văn B"));
//		
//		// đẩy dữ liệu xuống tầng view
//		model.addAttribute("employees", employees);
//		
////		// 1. Lấy thông tin từ Request Param. Ví dụ: localhost:8080/home?hovaten=quangnv&tuoi=20
////		String hovaten = request.getParameter("hovaten");
////		Integer tuoi = Integer.parseInt(request.getParameter("tuoi"));
////		System.out.println(hovaten+" "+tuoi);
////		// đường dẫn file view
		
		List<Product> products_hot = productsService.getEntitiesByNativeSQL("select * from tbl_products where is_hot = 1 and status = 1 limit 4");
		model.addAttribute("products_hot", products_hot);
		
		List<Product> products = productsService.getEntitiesByNativeSQL("select * from tbl_products where status = 1 limit 10");
		model.addAttribute("products", products);
		
		return "/customer/home"; // -> /WEB-INF/views/customer/home.jsp
	}
	
	
	@RequestMapping(value = { "/register" }, method = RequestMethod.GET)
	public String registerGet(final Model model,
					   final HttpServletRequest request,
					   final HttpServletResponse response) {
		
		User data = new User();
		model.addAttribute("user", data);
		
		return "/customer/register";
	}
	
	@RequestMapping(value = { "/register" }, method = RequestMethod.POST)
	public String registerPost(final Model model,
					   final HttpServletRequest request,
					   final HttpServletResponse response,
					   final @ModelAttribute("user") User user) {
		
		
//		List<User> users = userService.getEntitiesByNativeSQL("select * from tbl_users where status=1");
//		for (User u : users) {
//			if(user.getUsername() == u.getUsername()) {
//				user.setErrorCode(1);
//				break;
//			} else if(user.getEmail() == u.getEmail()) {
//				user.setErrorCode(2);
//				break;
//			} else if(user.getPhone() == u.getPhone()) {
//				user.setErrorCode(3);
//				break;
//			}
//		}
		user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));
		Role role = roleService.getById(19);
		user.addRoles(role);
		userService.saveOrUpdate(user);
		return "redirect:/login";

		
		
		
	}
	
	@RequestMapping(value = { "/account/information/{username}-{userID}"}, method = RequestMethod.GET)
	public String informationAccount(final Model model,
								   final HttpServletRequest request,
								   final HttpServletResponse response,
								   @PathVariable("userID") int userId) throws IOException{
		
		// lấy product theo id
		User userInDatabase = userService.getById(userId);
		model.addAttribute("user", userInDatabase);
		
		
		
		return "/customer/account";						   
	}
	
	@RequestMapping(value = { "/account/information"}, method = RequestMethod.POST)
	public String informationAccountPost(final Model model,
								   final HttpServletRequest request,
								   final HttpServletResponse response,
								   final @ModelAttribute("user") User user) throws IOException{
		
		// lấy product theo id
		
		userService.update(user);
		
		
		return "/customer/account";						   
	}
	
	@RequestMapping(value = { "/account/order/{username}-{userID}"}, method = RequestMethod.GET)
	public String myOrder(final Model model,
								   final HttpServletRequest request,
								   final HttpServletResponse response,
								   @PathVariable("userID") int userId) throws IOException{
		
		
		List<SaleOrder> orders = orderService.getEntitiesByNativeSQL("select * from tbl_saleorder where user_id="+userId+" order by code desc");
		model.addAttribute("orders", orders);
		
		
		
		return "/customer/my_order";						   
	}
	
	@RequestMapping(value = { "/order/complete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> completeMyOrder(final Model model, 
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
	@RequestMapping(value = { "/order/cancel" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> cancelMyOrder(final Model model, 
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
	
	
	
	
	
	
	

	

	// 2. Lấy thông tin theo Path Variables. Ví dụ: localhost:8080/getPathVariables/quangnv/20
	@RequestMapping(value = { "/getPathVariables/{hovaten}/{tuoi}" }, method = RequestMethod.GET)
	public String getPathVariables(final Model model,
					  final HttpServletRequest request,
					  final HttpServletResponse response,
					  @PathVariable("hovaten") String hovaten,
					  @PathVariable("tuoi") String tuoi) {
		System.out.println(hovaten+" "+tuoi);
		
		return "/customer/layout/home"; // -> /WEB-INF/views/customer/home.jsp
	}
	
	// Tạo request /hello
	@RequestMapping(value = { "/hello" }, method = RequestMethod.GET)
	public void hello(final Model model,
					  final HttpServletRequest request,
					  final HttpServletResponse response)
		throws IOException{
			response.getWriter().println("Hello World");
	}
	
	// Tạo request /xinchao
		@RequestMapping(value = { "/xinchao" }, method = RequestMethod.GET)
		public void xinchao(final Model model,
						  	final HttpServletRequest request,
						  	final HttpServletResponse response)
			throws IOException{
				response.getWriter().println("Xin chào mọi người");
		}
		
		@RequestMapping(value = { "/subscribe" }, method = RequestMethod.GET)
		public String subscribe(final Model model,
						  	  final HttpServletRequest request,
						  	  final HttpServletResponse response) {
			
			Subscribe data = new Subscribe();
			model.addAttribute("subscribe", data);
			
			return "/customer/subscribe"; // -> /WEB-INF/views/customer/contact.jsp
		}
		
		@RequestMapping(value = { "/subscribe" }, method = RequestMethod.POST)
		public ResponseEntity<Map<String, Object>> ajax_subscribe(final Model model, 
																final HttpServletRequest request,
																final HttpServletResponse response, 
																final @RequestBody Subscribe subscribe) {
			System.out.println(subscribe.getFullName());
			System.out.println(subscribe.getEmail());
			
			Map<String, Object> jsonResult = new HashMap<String, Object>();
			jsonResult.put("statusCode", 200); // status code ví dụ: 200: Success, 500: Error, 404: NotFound
			jsonResult.put("statusMessage", "Cảm ơn bạn " + subscribe.getEmail() + " đã đăng ký");
			return ResponseEntity.ok(jsonResult);
		}
}
