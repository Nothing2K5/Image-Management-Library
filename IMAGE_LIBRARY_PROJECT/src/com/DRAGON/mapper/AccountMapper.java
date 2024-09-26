package com.DRAGON.mapper;

import java.sql.ResultSet;

import com.DRAGON.model.AccountModel;

public class AccountMapper implements RowMapper<AccountModel> {

	@Override
	public AccountModel mapRow(ResultSet resultSet) {
		try {
			AccountModel accountModel = new AccountModel();
			accountModel.setId(resultSet.getInt("id"));
			accountModel.setFullName(resultSet.getString("fullname"));
			accountModel.setUserName(resultSet.getString("username"));
			accountModel.setPassword(resultSet.getString("password"));
			accountModel.setRoleId(resultSet.getInt("role_id"));
			accountModel.setCreatedDate(resultSet.getTimestamp("createddate"));
			if (resultSet.getTimestamp("modifieddate") != null) {
				accountModel.setModifiedDate(resultSet.getTimestamp("modifieddate"));
			}
			accountModel.setCreatedBy(resultSet.getString("createdby"));
			if ((resultSet.getString("modifiedby")) != null) {
				accountModel.setModifiedBy(resultSet.getString("modifiedby"));
			}
			return accountModel;
		} catch (Exception e) {
			return null;
		}
	}

}
