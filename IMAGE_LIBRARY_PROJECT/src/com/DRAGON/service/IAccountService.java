package com.DRAGON.service;

import java.util.List;

import com.DRAGON.model.AccountModel;
import com.DRAGON.paging.Pageable;

public interface IAccountService {
	AccountModel findByUserNameAndPassword(String userName, String password);

	boolean checkByUserName(String userName);

	boolean checkByRePassword(String rePassword, String password);
	
	boolean checkChangeUserNameById(Integer id, String userName);

	void signUp(AccountModel accountModel);

	List<AccountModel> findAllByPageable(Pageable pageable);

	AccountModel findOne(Integer id);

	Integer getTotalItem();

	AccountModel add(AccountModel accountModel);

	AccountModel edit(AccountModel updateAccount);

	void delete(Integer id);

	void resetIdentity();
}
