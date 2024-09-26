package com.DRAGON.mapper;

import java.sql.ResultSet;

import com.DRAGON.model.AlbumImageModel;

public class AlbumImageMapper implements RowMapper<AlbumImageModel> {

	@Override
	public AlbumImageModel mapRow(ResultSet resultSet) {
		try {
			AlbumImageModel albumImageModel = new AlbumImageModel();
			albumImageModel.setAlbumId(resultSet.getInt("album_id"));
			albumImageModel.setImageId(resultSet.getInt("image_id"));
			return albumImageModel;
		} catch (Exception e) {
			return null;
		}
	}

}
