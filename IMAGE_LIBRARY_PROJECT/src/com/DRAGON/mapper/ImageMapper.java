package com.DRAGON.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.DRAGON.model.ImageModel;

public class ImageMapper implements RowMapper<ImageModel> {

	@Override
	public ImageModel mapRow(ResultSet resultSet) {
		ImageModel imageModel = new ImageModel();
		try {
			imageModel.setId(resultSet.getInt("id"));
			imageModel.setName(resultSet.getString("name"));
			imageModel.setImage(resultSet.getString("image"));
			imageModel.setDescription(resultSet.getString("description"));
			imageModel.setCateId(resultSet.getInt("cate_id"));
			imageModel.setAccountId(resultSet.getInt("account_id"));
			imageModel.setCreatedDate(resultSet.getTimestamp("createddate"));
			if (resultSet.getTimestamp("modifieddate") != null) {
				imageModel.setModifiedDate(resultSet.getTimestamp("modifieddate"));
			}
			imageModel.setCreatedBy(resultSet.getString("createdby"));
			if ((resultSet.getString("modifiedby")) != null) {
				imageModel.setModifiedBy(resultSet.getString("modifiedby"));
			}
			return imageModel;
		} catch (SQLException e) {
			return null;
		}
	}

}
