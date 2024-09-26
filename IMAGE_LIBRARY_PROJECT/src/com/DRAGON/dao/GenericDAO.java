package com.DRAGON.dao;

import java.util.List;

import com.DRAGON.mapper.RowMapper;

public interface GenericDAO<T> {
	@SuppressWarnings("hiding")
	<T> List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters);

	void update(String sql, Object... parameters); // Update: edit, delete

	Integer insert(String sql, Object... parameters); // Insert: add

	Integer count(String sql, Object... parameters);

	Integer getIdentity(String sql);
	
	void backupOrRestore(String choose);
}
