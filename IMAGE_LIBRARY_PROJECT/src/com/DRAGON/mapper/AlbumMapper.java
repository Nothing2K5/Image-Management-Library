package com.DRAGON.mapper;

import java.sql.ResultSet;

import com.DRAGON.model.AlbumModel;

public class AlbumMapper implements RowMapper<AlbumModel> {

	@Override
	public AlbumModel mapRow(ResultSet resultSet) {
		try {
			AlbumModel albumModel = new AlbumModel();
			albumModel.setId(resultSet.getInt("id"));
			albumModel.setName(resultSet.getString("name"));
			albumModel.setDescription(resultSet.getString("description"));
			albumModel.setCoverImageId(resultSet.getInt("cover_image_id"));
			albumModel.setPrivacyStatus(resultSet.getString("privacy_status"));
			albumModel.setCreatedDate(resultSet.getTimestamp("createddate"));
			if (resultSet.getTimestamp("modifieddate") != null) {
				albumModel.setModifiedDate(resultSet.getTimestamp("modifieddate"));
			}	
			albumModel.setAccountId(resultSet.getInt("account_id"));
			return albumModel;
		} catch (Exception e) {
			return null;
		}
	}

}
