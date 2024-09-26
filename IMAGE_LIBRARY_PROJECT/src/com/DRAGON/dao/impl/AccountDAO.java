package com.DRAGON.dao.impl;

import java.util.List;

import com.DRAGON.dao.IAccountDAO;
import com.DRAGON.mapper.AccountMapper;
import com.DRAGON.model.AccountModel;
import com.DRAGON.paging.Pageable;

public class AccountDAO extends AbstractDAO<AccountModel> implements IAccountDAO {

	@Override
	public AccountModel findByUserNameAndPassword(String userName, String password) {
		StringBuilder sql = new StringBuilder("SELECT * FROM account AS a");
		sql.append(" INNER JOIN role AS r ON r.id = a.role_id");
		sql.append(" WHERE username = ? and password = ?");
		List<AccountModel> list = query(sql.toString(), new AccountMapper(), userName, password);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public boolean checkByUserName(String userName) {
		StringBuilder sql = new StringBuilder("SELECT * FROM account AS a");
		sql.append(" INNER JOIN role AS r ON r.id = a.role_id");
		sql.append(" WHERE username = ?");
		List<AccountModel> list = query(sql.toString(), new AccountMapper(), userName);
		return list.isEmpty() ? true : false;
	}

	@Override
	public boolean checkByRePassword(String rePassword, String password) {
		if (rePassword.equals(password)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void signUp(AccountModel accountModel) {
		String sql = "INSERT INTO account (fullname, username, password, role_id, createdby) VALUES (?,?,?,?,?)";
		insert(sql, accountModel.getFullName(), accountModel.getUserName(), accountModel.getPassword(), 2, accountModel.getCreatedBy());
	}

	@Override
	public List<AccountModel> findAllByPageable(Pageable pageable) {
		StringBuilder sql = new StringBuilder("SELECT * FROM account");
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
		return query(sql.toString(), new AccountMapper());
	}

	@Override
	public AccountModel findOne(Integer id) {
		String sql = "SELECT * FROM account WHERE id = ?";
		List<AccountModel> list = query(sql, new AccountMapper(), id);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public Integer getTotalItem() {
		String sql = "SELECT COUNT(*) FROM account";
		return count(sql);
	}

	@Override
	public Integer add(AccountModel accountModel) {
		String sql = "INSERT INTO account (fullname, username, password, role_id, createdby) VALUES (?,?,?,?,?)";
		return insert(sql, accountModel.getFullName(), accountModel.getUserName(), accountModel.getPassword(),
				accountModel.getRoleId(), accountModel.getCreatedBy());
	}

	@Override
	public void edit(AccountModel updateAccount) {
		StringBuilder sql = new StringBuilder("UPDATE account SET fullname = ?, username = ?, ");
		sql.append("password = ?, role_id = ?, ");
		sql.append("createdby = ?, modifiedby = ? WHERE id = ? ");
		update(sql.toString(), updateAccount.getFullName(), updateAccount.getUserName(), updateAccount.getPassword(),
				updateAccount.getRoleId(), updateAccount.getCreatedBy(), updateAccount.getModifiedBy(),
				updateAccount.getId());
	}

	@Override
	public void delete(Integer id) {
		String sql = "DELETE FROM image WHERE account_id = ? ";
		update(sql, id);
		sql = "DELETE FROM account WHERE id = ? ";
		update(sql, id);
	}

	@Override
	public void resetIdentity() {
		String sqlGetIdentity = "SELECT MAX(id) FROM account";
		int identity = getIdentity(sqlGetIdentity);
		String sqlSetIdentity = "DBCC CHECKIDENT ('account', RESEED, ?)";
		query(sqlSetIdentity, new AccountMapper(), identity);
	}

}
