package com.DRAGON.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.DRAGON.dao.IAlbumDAO;
import com.DRAGON.model.AlbumModel;
import com.DRAGON.paging.Pageable;
import com.DRAGON.service.IAlbumService;

public class AlbumService implements IAlbumService {

	@Inject
	IAlbumDAO albumDAO;

	@Override
	public List<AlbumModel> findAll() {
		return albumDAO.findAll();
	}

	@Override
	public List<AlbumModel> findAllByPageable(Pageable pageable) {
		return albumDAO.findAllByPageable(pageable);
	}

	@Override
	public AlbumModel findOne(Integer id) {
		return albumDAO.findOne(id);
	}

	@Override
	public Integer getTotalItem() {
		return albumDAO.getTotalItem();
	}

	@Override
	public Integer getMaxId() {
		return albumDAO.getMaxId();
	}

	@Override
	public AlbumModel create(AlbumModel albumModel) {
		Integer id = albumDAO.create(albumModel);
		return albumDAO.findOne(id);
	}

	@Override
	public AlbumModel edit(AlbumModel updateAlbum) {
		albumDAO.edit(updateAlbum);
		return albumDAO.findOne(updateAlbum.getId());
	}

	@Override
	public void delete(Integer id) {
		albumDAO.delete(id);
	}

	@Override
	public void resetIdentity() {
		albumDAO.resetIdentity();
	}
}
