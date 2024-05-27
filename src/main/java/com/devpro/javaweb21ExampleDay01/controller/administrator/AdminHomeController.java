package com.devpro.javaweb21ExampleDay01.controller.administrator;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21ExampleDay01.controller.BaseController;

@Controller
public class AdminHomeController extends BaseController{
	
	
	@RequestMapping(value = { "/admin/home" }, method = RequestMethod.GET)
	public String adminHome(final Model model,
					  final HttpServletRequest request,
					  final HttpServletResponse response) {
		
		
		return "/administrator/home"; // -> /WEB-INF/views/administrator/home.jsp
	}
	
	
	

}
