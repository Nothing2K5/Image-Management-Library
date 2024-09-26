package com.DRAGON.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DRAGON.model.AccountModel;
import com.DRAGON.service.IAccountService;
import com.DRAGON.service.IImageService;
import com.DRAGON.utils.HttpUtil;
import com.DRAGON.utils.SessionUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(urlPatterns = { "/api-account" })
public class AccountAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	IAccountService accountService;

	@Inject
	IImageService imageService;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");// Set UTF-8 cho data tu client tra ve server
		response.setContentType("application/json");// Set application/json cho data tu server tra ve client
		AccountModel accountModel = HttpUtil.of(request.getReader()).toModel(AccountModel.class);
		boolean checkExist = accountService.checkByUserName(accountModel.getUserName());
		if (checkExist == true) {
			accountModel.setCreatedBy(((AccountModel) SessionUtil.getInstance().getValue(request, "ACCOUNTMODEL")).getUserName());
			accountModel = accountService.add(accountModel);
			mapper.writeValue(response.getOutputStream(), accountModel);
		} 		
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");// Set UTF-8 cho data tu client tra ve server
		response.setContentType("application/json");// Set application/json cho data tu server tra ve client
		AccountModel updateAccount = HttpUtil.of(request.getReader()).toModel(AccountModel.class);
		boolean checkExist = accountService.checkByUserName(updateAccount.getUserName());
		boolean checkChange = accountService.checkChangeUserNameById(updateAccount.getId(), updateAccount.getUserName());
		if (checkExist == true || checkChange == true) {
			updateAccount.setModifiedBy(((AccountModel) SessionUtil.getInstance().getValue(request, "ACCOUNTMODEL")).getUserName());
			updateAccount = accountService.edit(updateAccount);
			mapper.writeValue(response.getOutputStream(), updateAccount);
		}
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");// Set UTF-8 cho data tu client tra ve server
		response.setContentType("application/json");// Set application/json cho data tu server tra ve client
		AccountModel accountModel = HttpUtil.of(request.getReader()).toModel(AccountModel.class);
		accountService.delete(accountModel.getId());
		imageService.resetIdentity();
		accountService.resetIdentity();
		mapper.writeValue(response.getOutputStream(), "{}");
	}
}
