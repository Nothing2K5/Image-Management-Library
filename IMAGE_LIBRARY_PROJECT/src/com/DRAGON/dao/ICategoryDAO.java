package com.DRAGON.dao;

import java.util.List;

import com.DRAGON.model.CategoryModel;
import com.DRAGON.paging.Pageable;

public interface ICategoryDAO extends GenericDAO<CategoryModel> {
	List<CategoryModel> findAll();

	CategoryModel findOne(Integer id);
	
	List<CategoryModel> findAllByPageable(Pageable pageable);
	
	Integer getTotalItem();

	Integer getMaxId();
	
	Integer add(CategoryModel categoryModel);

	void edit(CategoryModel updateCategory);

	void delete(Integer id);

	void resetIdentity();

}
