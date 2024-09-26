package com.DRAGON.dao.impl;

import java.util.List;

import com.DRAGON.dao.IRoleDAO;
import com.DRAGON.mapper.RoleMapper;
import com.DRAGON.model.RoleModel;

public class RoleDAO extends AbstractDAO<RoleModel> implements IRoleDAO {
	@Override
	public List<RoleModel> findAll() {
		String sql = "SELECT * FROM role";
		return query(sql, new RoleMapper());
	}

	@Override
	public RoleModel findOne(Integer id) {
		String sql = "SELECT * FROM role WHERE id = ?";
		List<RoleModel> list = query(sql, new RoleMapper(), id);
		return list.isEmpty() ? null : list.get(0);
	}

}
