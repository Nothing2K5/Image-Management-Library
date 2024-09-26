package com.DRAGON.model;

public class AlbumImageModel extends AbstractModel<AlbumImageModel> {
	private Integer albumId;
	private Integer imageId;

	public Integer getAlbumId() {
		return albumId;
	}

	public void setAlbumId(Integer albumId) {
		this.albumId = albumId;
	}

	public Integer getImageId() {
		return imageId;
	}

	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}

}
