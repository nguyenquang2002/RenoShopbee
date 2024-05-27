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

import com.devpro.javaweb21ExampleDay01.controller.BaseController;
import com.devpro.javaweb21ExampleDay01.dto.UserSearchModel;
import com.devpro.javaweb21ExampleDay01.model.Role;
import com.devpro.javaweb21ExampleDay01.model.User;
import com.devpro.javaweb21ExampleDay01.services.PagerData;
import com.devpro.javaweb21ExampleDay01.services.RoleService;
import com.devpro.javaweb21ExampleDay01.services.UserService;

@Controller
public class AdminUserController extends BaseController{
	
	@Autowired
	UserService userService = new UserService();
	
	@Autowired
	RoleService roleService = new RoleService();
	
	@RequestMapping(value = { "/admin/user" }, method = RequestMethod.GET)
	public String adminUser(final Model model,
							   final HttpServletRequest request,
							   final HttpServletResponse response) {
		
		String keyword = request.getParameter("keyword");
		Integer roleId = getInteger(request, "roleId");
		
		UserSearchModel searchModel = new UserSearchModel();
		searchModel.setKeyword(keyword);
		searchModel.setRoleId(roleId);
		searchModel.setPage(getCurrentPage(request));
		
		PagerData<User> users = userService.search(searchModel);
		
		model.addAttribute("users", users);
		model.addAttribute("searchModel", searchModel);
		
		return "/administrator/users"; // -> /WEB-INF/views/administrator/home.jsp
	}
	
	@RequestMapping(value = { "/admin/user/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteUser(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody User user) {
		
		User userInDb = userService.getById(user.getId());
		userInDb.setStatus(false);
		userService.saveOrUpdate(userInDb);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
	
	@RequestMapping(value = { "/admin/user/addCO" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addCOUser(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody User user) {
		
		User userInDb = userService.getById(user.getId());
		Role role = roleService.getById(18);
		userInDb.addRoles(role);
		userService.saveOrUpdate(userInDb);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
	
	@RequestMapping(value = { "/admin/user/removeCO" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> removeCOUser(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody User user) {
		
		User userInDb = userService.getById(user.getId());
		Role role = roleService.getById(18);
		userInDb.deleteRole(role);
		userService.saveOrUpdate(userInDb);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
	
	@RequestMapping(value = { "/admin/user/management" }, method = RequestMethod.GET)
	public String adminManageUser(final Model model,
					  final HttpServletRequest request,
					  final HttpServletResponse response) {
		
		User user = new User();
		model.addAttribute("user", user);

		return "/administrator/user_management"; // -> /WEB-INF/views/administrator/home.jsp
	}
	

	@RequestMapping(value = { "/admin/user/management" }, method = RequestMethod.POST)
	public String adminManagementUserPost(final Model model,
											 final HttpServletRequest request,
											 final HttpServletResponse response,
											 final @ModelAttribute("user") User user)throws Exception {
		
		
		if(user.getId() == null || user.getId() < 0 ) {
			userService.add(user);
		}
		else {
			userService.update(user);
		}
		
		
		return "redirect:/admin/user"; 
	}
	
	@RequestMapping(value = { "/admin/user/management/{userID}"}, method = RequestMethod.GET)
	public String adminUserEdit(final Model model,
								   final HttpServletRequest request,
								   final HttpServletResponse response,
								   @PathVariable("userID") int userID) throws IOException{
		
		// lấy user theo id
		User userInDB = userService.getById(userID);
		model.addAttribute("user", userInDB);
		
		
		
		return "/administrator/user_management";						   
	}
}
