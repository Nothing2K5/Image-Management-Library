package com.DRAGON.dao.impl;

import java.util.List;

import com.DRAGON.dao.ICategoryDAO;
import com.DRAGON.mapper.CategoryMapper;
import com.DRAGON.model.CategoryModel;
import com.DRAGON.paging.Pageable;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {

	@Override
	public List<CategoryModel> findAll() {
		String sql = "SELECT * FROM category";
		return query(sql, new CategoryMapper());
	}

	@Override
	public CategoryModel findOne(Integer id) {
		String sql = "SELECT * FROM category WHERE id = ?";
		List<CategoryModel> list = query(sql, new CategoryMapper(), id);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public List<CategoryModel> findAllByPageable(Pageable pageable) {
		StringBuilder sql = new StringBuilder("SELECT * FROM category");
		if (pageable.getSorter().getSortName() != null && pageable.getSorter().getSortBy() != null) {
			/*
			 * pageble.getSorter() != null &&
			 * StringUtils.isNotBlank(pageble.getSorter().getSortName()) &&
			 * StringUtils.isNotBlank(pageble.getSorter().getSortBy()
			 */
			sql.append(" ORDER BY " + pageable.getSorter().getSortName() + " " + pageable.getSorter().getSortBy() + "");
		} else {
			sql.append(" ORDER BY (SELECT NULL)");
		}
		if (pageable.getOffset() != null && pageable.getLimit() != null) {
			sql.append(" OFFSET " + pageable.getOffset() + " ROWS FETCH NEXT " + pageable.getLimit() + " ROWS ONLY;");
		}
		return query(sql.toString(), new CategoryMapper());
	}

	@Override
	public Integer getTotalItem() {
		String sql = "SELECT COUNT(*) FROM category";
		return count(sql);
	}

	@Override
	public Integer getMaxId() {
		String sql = "SELECT MAX(id) FROM category";
		return count(sql);
	}

	@Override
	public Integer add(CategoryModel categoryModel) {
		String sql = "INSERT INTO category (name, createdby) VALUES (?,?)";
		return insert(sql, categoryModel.getName(), categoryModel.getCreatedBy());
	}

	@Override
	public void edit(CategoryModel updateCategory) {
		String sql = "UPDATE category SET name = ?, createdby = ?, modifiedby = ? WHERE id = ? ";
		update(sql.toString(), updateCategory.getName(), updateCategory.getCreatedBy(), updateCategory.getModifiedBy(),
				updateCategory.getId());
	}

	@Override
	public void delete(Integer id) {
		String sql = "DELETE FROM image WHERE cate_id = ? ";
		update(sql, id);
		sql = "DELETE FROM category WHERE id = ? ";
		update(sql, id);
	}

	@Override
	public void resetIdentity() {
		String sqlGetIdentity = ("SELECT MAX(id) FROM category");
		int identity = getIdentity(sqlGetIdentity);
		String sqlSetIdentity = "DBCC CHECKIDENT ('category', RESEED, ?)";
		query(sqlSetIdentity, new CategoryMapper(), identity);
	}

}
