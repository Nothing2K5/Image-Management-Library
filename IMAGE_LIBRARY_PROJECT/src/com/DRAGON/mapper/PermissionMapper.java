package com.DRAGON.mapper;

import java.sql.ResultSet;

import com.DRAGON.model.PermissionModel;

public class PermissionMapper implements RowMapper<PermissionModel> {

	@Override
	public PermissionModel mapRow(ResultSet resultSet) {
		try {
			PermissionModel permissionModel = new PermissionModel();
			permissionModel.setId(resultSet.getInt("id"));
			permissionModel.setRoleId(resultSet.getInt("role_id"));
			permissionModel.setEntity(resultSet.getString("entity"));
			permissionModel.setAction(resultSet.getString("action"));
			return permissionModel;
		} catch (Exception e) {
			return null;
		}
	}
}
