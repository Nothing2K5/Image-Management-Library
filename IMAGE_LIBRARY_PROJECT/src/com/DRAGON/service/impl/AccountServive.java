package com.DRAGON.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.DRAGON.dao.IAccountDAO;
import com.DRAGON.model.AccountModel;
import com.DRAGON.paging.Pageable;
import com.DRAGON.service.IAccountService;

public class AccountServive implements IAccountService {

	@Inject
	IAccountDAO accountDAO;

	@Override
	public AccountModel findByUserNameAndPassword(String userName, String password) {
		return accountDAO.findByUserNameAndPassword(userName, password);
	}

	@Override
	public boolean checkByUserName(String userName) {
		return accountDAO.checkByUserName(userName);
	}

	@Override
	public boolean checkByRePassword(String rePassword, String password) {
		return accountDAO.checkByRePassword(rePassword, password);
	}

	@Override
	public boolean checkChangeUserNameById(Integer id, String userName) {
		AccountModel accountModel = new AccountModel();
		accountModel = accountDAO.findOne(id);
		if (accountModel.getUserName().equals(userName)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void signUp(AccountModel accountModel) {
		accountModel.setCreatedBy(accountModel.getUserName());
		accountDAO.signUp(accountModel);
	}

	@Override
	public List<AccountModel> findAllByPageable(Pageable pageable) {
		return accountDAO.findAllByPageable(pageable);
	}

	@Override
	public AccountModel findOne(Integer id) {
		return accountDAO.findOne(id);
	}

	@Override
	public Integer getTotalItem() {
		return accountDAO.getTotalItem();
	}

	@Override
	public AccountModel add(AccountModel accountModel) {
		// Su dung neu khongdung GETDATE() trong sql server
		// accountModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		Integer id = accountDAO.add(accountModel);
		return accountDAO.findOne(id);
	}

	@Override
	public AccountModel edit(AccountModel updateAccount) {
		AccountModel oldAccount = accountDAO.findOne(updateAccount.getId());
		// Su dung neu khongdung GETDATE() trong sql server
		// updateAccount.setCreatedDate(oldAccount.getCreatedDate());
		// updateAccount.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		updateAccount.setCreatedBy(oldAccount.getCreatedBy());
		accountDAO.edit(updateAccount);
		return accountDAO.findOne(updateAccount.getId());
	}

	@Override
	public void delete(Integer id) {
		accountDAO.delete(id);
	}

	@Override
	public void resetIdentity() {
		accountDAO.resetIdentity();
	}
}
