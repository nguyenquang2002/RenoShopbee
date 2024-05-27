package com.devpro.javaweb21ExampleDay01.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb21ExampleDay01.model.Role;

@Service
public class RoleService extends BaseService<Role>{

	@Override
	protected Class<Role> clazz() {
		// TODO Auto-generated method stub
		return Role.class;
	}
	
}
