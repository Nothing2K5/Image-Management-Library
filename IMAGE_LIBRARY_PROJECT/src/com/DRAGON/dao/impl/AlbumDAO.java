package com.DRAGON.dao.impl;

import java.util.List;

import com.DRAGON.dao.IAlbumDAO;
import com.DRAGON.mapper.AlbumMapper;
import com.DRAGON.mapper.ImageMapper;
import com.DRAGON.model.AlbumModel;
import com.DRAGON.paging.Pageable;

public class AlbumDAO extends AbstractDAO<AlbumModel> implements IAlbumDAO {

	@Override
	public List<AlbumModel> findAll() {
		String sql = "SELECT * FROM album";
		return query(sql, new AlbumMapper());
	}

	@Override
	public List<AlbumModel> findAllByPageable(Pageable pageable) {
		StringBuilder sql = new StringBuilder("SELECT * FROM album");
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
		return query(sql.toString(), new AlbumMapper());
	}

	@Override
	public AlbumModel findOne(Integer id) {
		String sql = "SELECT * FROM album WHERE id = ?";
		List<AlbumModel> list = query(sql, new AlbumMapper(), id);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public Integer getTotalItem() {
		String sql = "SELECT COUNT(*) FROM album";
		return count(sql);
	}

	@Override
	public Integer getMaxId() {
		String sql = "SELECT MAX(id) FROM album";
		return count(sql);
	}

	@Override
	public Integer create(AlbumModel albumModel) {
		String sql = "INSERT INTO album (name, description, cover_image_id, privacy_status, account_id) VALUES (?,?,?,?,?)";
		return insert(sql, albumModel.getName(), albumModel.getDescription(), albumModel.getCoverImageId(),
				albumModel.getPrivacyStatus(), albumModel.getAccountId());
	}

	@Override
	public void edit(AlbumModel updateAlbum) {
		StringBuilder sql = new StringBuilder("UPDATE album SET name = ?, description = ?, ");
		sql.append("cover_image_id = ?, privacy_status = ?, account_id = ? ");
		sql.append("WHERE id = ? ");
		update(sql.toString(), updateAlbum.getName(), updateAlbum.getDescription(), updateAlbum.getCoverImageId(),
				updateAlbum.getPrivacyStatus(), updateAlbum.getAccountId(), updateAlbum.getId());
	}

	@Override
	public void delete(Integer id) {
		String sql = "DELETE FROM album WHERE id = ? ";
		update(sql, id);
	}

	@Override
	public void resetIdentity() {
		String sqlGetIdentity = ("SELECT MAX(id) FROM album");
		int identity = getIdentity(sqlGetIdentity);
		String sqlSetIdentity = "DBCC CHECKIDENT ('album', RESEED, ?)";
		query(sqlSetIdentity, new ImageMapper(), identity);
	}
}
