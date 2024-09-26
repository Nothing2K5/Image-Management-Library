package com.DRAGON.dao;

import java.util.List;

import com.DRAGON.model.RoleModel;

public interface IRoleDAO extends GenericDAO<RoleModel> {
	List<RoleModel> findAll();

	RoleModel findOne(Integer id);

}
