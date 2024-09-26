package com.DRAGON.mapper;

import java.sql.ResultSet;

import com.DRAGON.model.CategoryModel;

public class CategoryMapper implements RowMapper<CategoryModel> {

	@Override
	public CategoryModel mapRow(ResultSet resultSet) {
		try {
			CategoryModel categoryModel = new CategoryModel();
			categoryModel.setId(resultSet.getInt("id"));
			categoryModel.setName(resultSet.getString("name"));
			categoryModel.setCreatedDate(resultSet.getTimestamp("createddate"));
			if (resultSet.getTimestamp("modifieddate") != null) {
				categoryModel.setModifiedDate(resultSet.getTimestamp("modifieddate"));
			}
			categoryModel.setCreatedBy(resultSet.getString("createdby"));
			if ((resultSet.getString("modifiedby")) != null) {
				categoryModel.setModifiedBy(resultSet.getString("modifiedby"));
			}
			return categoryModel;
		} catch (Exception e) {
			return null;
		}
	}

}
