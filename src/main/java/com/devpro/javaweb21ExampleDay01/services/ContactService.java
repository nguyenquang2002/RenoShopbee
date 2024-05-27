package com.devpro.javaweb21ExampleDay01.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb21ExampleDay01.model.Contact;
/*
 * Mỗi entity sẽ cần 1 service
 * Để thực hiện thêm sửa xóa search entity có trong database
 */

@Service
public class ContactService extends BaseService<Contact> {

	@Override
	protected Class<Contact> clazz() {
		
		return Contact.class;
	}
	
}
