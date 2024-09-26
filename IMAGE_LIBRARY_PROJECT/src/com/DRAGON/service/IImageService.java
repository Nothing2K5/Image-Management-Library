package com.DRAGON.service;

import java.util.List;

import com.DRAGON.model.ImageModel;
import com.DRAGON.paging.Pageable;

public interface IImageService {
	List<ImageModel> findAll();

	List<ImageModel> findAllByCateId(Integer cateId);

	List<ImageModel> findAllByName(String name);

	List<ImageModel> findAllByPageable(Pageable pageable);

	ImageModel findOne(Integer id);

	Integer getTotalItem();

	Integer getMaxId();

	ImageModel add(ImageModel imageModel);

	ImageModel edit(ImageModel updateImage);

	void delete(Integer id);

	void resetIdentity();
	
	Integer download(ImageModel imageModel);

	/* void resetIdentity(Integer id); */
}
