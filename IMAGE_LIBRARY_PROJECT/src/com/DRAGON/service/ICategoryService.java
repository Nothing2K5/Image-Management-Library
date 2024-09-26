package com.DRAGON.service;

import java.util.List;

import com.DRAGON.model.CategoryModel;
import com.DRAGON.paging.Pageable;

public interface ICategoryService {
	List<CategoryModel> findAll();

	CategoryModel findOne(Integer id);

	List<CategoryModel> findAllByPageable(Pageable pageable);

	Integer getTotalItem();

	Integer getMaxId();

	CategoryModel add(CategoryModel categoryModel);

	CategoryModel edit(CategoryModel updateCategory);

	void delete(Integer id);

	void resetIdentity();

}
