package com.devpro.javaweb21ExampleDay01.services;

import com.devpro.javaweb21ExampleDay01.model.BaseEntity;

public interface MappingCustomEntity<E extends BaseEntity> {
	public E convert(Object[] data);
}
