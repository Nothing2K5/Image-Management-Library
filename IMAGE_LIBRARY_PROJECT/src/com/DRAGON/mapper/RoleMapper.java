package com.DRAGON.mapper;

import java.sql.ResultSet;

import com.DRAGON.model.RoleModel;

public class RoleMapper implements RowMapper<RoleModel> {

	@Override
	public RoleModel mapRow(ResultSet resultSet) {
		try {
			RoleModel roleModel = new RoleModel();
			roleModel.setId(resultSet.getInt("id"));
			roleModel.setName(resultSet.getString("name"));
			roleModel.setCode(resultSet.getString("code"));
			roleModel.setCreatedDate(resultSet.getTimestamp("createddate"));
			if (resultSet.getTimestamp("modifieddate") != null) {
				roleModel.setModifiedDate(resultSet.getTimestamp("modifieddate"));
			}
			roleModel.setCreatedBy(resultSet.getString("createdby"));
			if ((resultSet.getString("modifiedby")) != null) {
				roleModel.setModifiedBy(resultSet.getString("modifiedby"));
			}
			return roleModel;
		} catch (Exception e) {
			return null;
		}
	}

}
