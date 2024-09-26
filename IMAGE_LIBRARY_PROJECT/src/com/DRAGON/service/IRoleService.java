package com.DRAGON.service;

import java.util.List;

import com.DRAGON.model.RoleModel;

public interface IRoleService {
	List<RoleModel> findAll();

	RoleModel findOne(Integer id);
}
