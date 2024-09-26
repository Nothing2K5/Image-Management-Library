package com.DRAGON.dao;

import java.util.List;

import com.DRAGON.model.ImageModel;
import com.DRAGON.paging.Pageable;

public interface IImageDAO extends GenericDAO<ImageModel> {
	List<ImageModel> findAll();

	List<ImageModel> findAllByCateId(Integer cateId);

	List<ImageModel> findAllByName(String name);

	List<ImageModel> findAllByPageable(Pageable pageable);

	ImageModel findOne(Integer id);

	Integer getTotalItem();

	Integer getMaxId();

	Integer add(ImageModel imageModel);

	void edit(ImageModel updateImage);

	void delete(Integer id);

	void resetIdentity();

	/* void resetIdentity(Integer id); */
}
