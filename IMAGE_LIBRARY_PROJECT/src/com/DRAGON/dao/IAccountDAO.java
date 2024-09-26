package com.DRAGON.dao;

import java.util.List;

import com.DRAGON.model.AccountModel;
import com.DRAGON.paging.Pageable;

public interface IAccountDAO extends GenericDAO<AccountModel> {
	AccountModel findByUserNameAndPassword(String userName, String password);

	boolean checkByUserName(String userName);

	boolean checkByRePassword(String rePassword, String password);

	void signUp(AccountModel accountModel);

	List<AccountModel> findAllByPageable(Pageable pageable);

	AccountModel findOne(Integer id);

	Integer getTotalItem();

	Integer add(AccountModel accountModel);

	void edit(AccountModel updateAccount);

	void delete(Integer id);

	void resetIdentity();
}
