package com.DRAGON.dao.impl;

import java.util.List;

import com.DRAGON.dao.IImageDAO;
import com.DRAGON.mapper.ImageMapper;
import com.DRAGON.model.ImageModel;
import com.DRAGON.paging.Pageable;

public class ImageDAO extends AbstractDAO<ImageModel> implements IImageDAO {

	@Override
	public List<ImageModel> findAll() {
		String sql = "SELECT * FROM image";
		return query(sql, new ImageMapper());
	}

	@Override
	public List<ImageModel> findAllByCateId(Integer cateId) {
		String sql = "SELECT * FROM image WHERE cate_id = ?";
		return query(sql, new ImageMapper(), cateId);
	}

	@Override
	public List<ImageModel> findAllByName(String name) {
		String sql = "SELECT * FROM image WHERE name LIKE '%" + name + "%'";
		return query(sql, new ImageMapper());
	}

	@Override
	public List<ImageModel> findAllByPageable(Pageable pageable) {
		StringBuilder sql = new StringBuilder("SELECT * FROM image");
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
		return query(sql.toString(), new ImageMapper());
	}

	@Override
	public ImageModel findOne(Integer id) {
		String sql = "SELECT * FROM image WHERE id = ?";
		List<ImageModel> list = query(sql, new ImageMapper(), id);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public Integer getTotalItem() {
		String sql = "SELECT COUNT(*) FROM image";
		return count(sql);
	}

	@Override
	public Integer getMaxId() {
		String sql = "SELECT MAX(id) FROM image";
		return count(sql);
	}

	@Override
	public Integer add(ImageModel imageModel) {
		String sql = "INSERT INTO image (name, image, description, cate_id, account_id, createdby) VALUES (?,?,?,?,?,?)";
		return insert(sql, imageModel.getName(), imageModel.getImage(), imageModel.getDescription(),
				imageModel.getCateId(), imageModel.getAccountId(), imageModel.getCreatedBy());
	}

	@Override
	public void edit(ImageModel updateImage) {
		StringBuilder sql = new StringBuilder("UPDATE image SET name = ?, image = ?, ");
		sql.append("description = ?, cate_id = ?, account_id = ?, ");
		sql.append("createdby = ?, modifiedby = ? WHERE id = ? ");
		update(sql.toString(), updateImage.getName(), updateImage.getImage(), updateImage.getDescription(),
				updateImage.getCateId(), updateImage.getAccountId(), updateImage.getCreatedBy(),
				updateImage.getModifiedBy(), updateImage.getId());
	}

	@Override
	public void delete(Integer id) {
		String sql = "DELETE FROM image WHERE id = ? ";
		update(sql, id);
	}

	@Override
	public void resetIdentity() {
		String sqlGetIdentity = ("SELECT MAX(id) FROM image");
		int identity = getIdentity(sqlGetIdentity);
		String sqlSetIdentity = "DBCC CHECKIDENT ('image', RESEED, ?)";
		query(sqlSetIdentity, new ImageMapper(), identity);
	}

	/*
	 * @Override public void resetIdentity(Integer id) { String sqlSetIdentity =
	 * "DBCC CHECKIDENT ('image', RESEED, ?)"; query(sqlSetIdentity, new
	 * ImageMapper(), id); }
	 */

}
