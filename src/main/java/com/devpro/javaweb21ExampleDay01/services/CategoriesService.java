package com.devpro.javaweb21ExampleDay01.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb21ExampleDay01.model.Category;

@Service
public class CategoriesService extends BaseService<Category>{

	@Override
	protected Class<Category> clazz() {
		// TODO Auto-generated method stub
		return Category.class;
	}

}
