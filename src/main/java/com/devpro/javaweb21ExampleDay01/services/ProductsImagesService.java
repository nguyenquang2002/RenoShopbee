package com.devpro.javaweb21ExampleDay01.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb21ExampleDay01.model.ProductImages;

@Service
public class ProductsImagesService extends BaseService<ProductImages>{

	@Override
	protected Class<ProductImages> clazz() {
		// TODO Auto-generated method stub
		return ProductImages.class;
	}
	
}
