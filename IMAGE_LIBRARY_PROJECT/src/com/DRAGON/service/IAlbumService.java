package com.DRAGON.service;

import java.util.List;

import com.DRAGON.model.AlbumModel;
import com.DRAGON.paging.Pageable;

public interface IAlbumService {
	List<AlbumModel> findAll();

	List<AlbumModel> findAllByPageable(Pageable pageable);

	AlbumModel findOne(Integer id);

	Integer getTotalItem();

	Integer getMaxId();

	AlbumModel create(AlbumModel albumModel);

	AlbumModel edit(AlbumModel updateAlbum);

	void delete(Integer id);

	void resetIdentity();
}
