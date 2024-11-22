package com.DRAGON.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.DRAGON.dao.ICategoryDAO;
import com.DRAGON.model.CategoryModel;
import com.DRAGON.paging.Pageable;
import com.DRAGON.service.ICategoryService;

public class CategoryService implements ICategoryService {

	@Inject
	private ICategoryDAO categoryDAO;

	@Override
	public List<CategoryModel> findAll() {
		return categoryDAO.findAll();
	}

	@Override
	public CategoryModel findOne(Integer id) {
		return categoryDAO.findOne(id);
	}

	@Override
	public List<CategoryModel> findAllByPageable(Pageable pageable) {
		return categoryDAO.findAllByPageable(pageable);
	}

	@Override
	public Integer getTotalItem() {
		return categoryDAO.getTotalItem();
	}

	@Override
	public Integer getMaxId() {
		return categoryDAO.getMaxId();
	}

	@Override
	public CategoryModel add(CategoryModel categoryModel) {
		Integer id = categoryDAO.add(categoryModel);
		return categoryDAO.findOne(id);
	}

	@Override
	public CategoryModel edit(CategoryModel updateCategory) {
		CategoryModel oldCategory = categoryDAO.findOne(updateCategory.getId());
		updateCategory.setCreatedBy(oldCategory.getCreatedBy());
		categoryDAO.edit(updateCategory);
		return categoryDAO.findOne(updateCategory.getId());
	}

	@Override
	public void delete(Integer id) {
		categoryDAO.delete(id);
	}

	@Override
	public void resetIdentity() {
		categoryDAO.resetIdentity();
	}

}
