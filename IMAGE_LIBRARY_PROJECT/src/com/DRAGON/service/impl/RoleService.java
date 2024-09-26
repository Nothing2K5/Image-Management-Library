package com.DRAGON.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.DRAGON.dao.IRoleDAO;
import com.DRAGON.model.RoleModel;
import com.DRAGON.service.IRoleService;

public class RoleService implements IRoleService {

	@Inject
	IRoleDAO roleDao;

	@Override
	public List<RoleModel> findAll() {
		return roleDao.findAll();
	}

	@Override
	public RoleModel findOne(Integer id) {
		return roleDao.findOne(id);
	}

}
