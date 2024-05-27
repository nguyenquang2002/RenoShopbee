package com.devpro.javaweb21ExampleDay01.controller.customer;


import java.io.File;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb21ExampleDay01.controller.BaseController;
import com.devpro.javaweb21ExampleDay01.model.Contact;
import com.devpro.javaweb21ExampleDay01.services.ContactService;

@Controller
public class ContactController extends BaseController{
	
	// inject 1 bean vào trong 1 bean
	// Các bean được quả lý bởi spring-container
	@Autowired
	private ContactService contactService;
	
	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String contact(final Model model,
					  	  final HttpServletRequest request,
					  	  final HttpServletResponse response) {
		
		Contact data = new Contact();
		model.addAttribute("contact", data);
		
		return "/customer/contact"; // -> /WEB-INF/views/customer/contact.jsp
	}

//	Cách 1: Cách đơn giản
//	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST)
//	public String contact_post(final Model model,
//					  	  	   final HttpServletRequest request,
//					  	  	   final HttpServletResponse response) {
//		String fullname = request.getParameter("fullname");
//		String email = request.getParameter("email");
//		String subject = request.getParameter("subject");
//		String message = request.getParameter("message");
//		
//		System.out.println(fullname+"/ "+email+"/ "+subject+"/ "+message);
//		
//		return "/customer/contact"; // -> /WEB-INF/views/customer/contact.jsp
//	}

	
//	Cách 2: hứng data từ spring-form lên
	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST)
	public String contact_post(final Model model,
					  	  	   final HttpServletRequest request,
					  	  	   final HttpServletResponse response,
					  	  	   final @ModelAttribute Contact contact,
					  	  	   final @RequestParam("attachment") MultipartFile attachmentFile) throws IOException {
		System.out.println(contact.getFullName());
		
		// lưu contact vào trong database
		contactService.saveOrUpdate(contact);
		// lưu file lên server nếu có uploadfile
		if(!attachmentFile.isEmpty()) {
			attachmentFile.transferTo(new File("C:/upload/"+attachmentFile.getOriginalFilename()));
		}
		
		// reset form
		Contact data = new Contact();
		model.addAttribute(data);
		
		return "/customer/contact";
	}
	
	
	//cách 3: sử dụng Ajax
		//đối với cách này thì chỉ refresh 1 số phần của trang web không reload lại
		//với ajax sẽ không trả về view(refresh lại) mà trả về kiểu ResponseEntity có giá trị kiểu Map<String, Object>
		//@RequestBody dùng để hứng data
		@RequestMapping(value = { "/ajax/contact" }, method = RequestMethod.POST)
		public ResponseEntity<Map<String, Object>> ajax_contact(final Model model, 
																final HttpServletRequest request,
																final HttpServletResponse response, 
																final @RequestBody Contact contact) {
			System.out.println(contact.getEmail());
			System.out.println(contact.getMessage());
			
			Map<String, Object> jsonResult = new HashMap<String, Object>();
			jsonResult.put("statusCode", 200); // status code ví dụ: 200: Success, 500: Error, 404: NotFound
			jsonResult.put("statusMessage", "Cảm ơn bạn " + contact.getEmail() + ", Chúng tôi sẽ liên hệ sớm nhất!");
			return ResponseEntity.ok(jsonResult);
		}
}
