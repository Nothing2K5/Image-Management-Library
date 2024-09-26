package com.DRAGON.dao;

import java.util.List;

import com.DRAGON.model.AlbumModel;
import com.DRAGON.paging.Pageable;

public interface IAlbumDAO extends GenericDAO<AlbumModel> {
	List<AlbumModel> findAll();

	List<AlbumModel> findAllByPageable(Pageable pageable);

	AlbumModel findOne(Integer id);

	Integer getTotalItem();

	Integer getMaxId();

	Integer create(AlbumModel albumModel);
	
	void edit(AlbumModel updateAlbum);

	void delete(Integer id);

	void resetIdentity();

}
