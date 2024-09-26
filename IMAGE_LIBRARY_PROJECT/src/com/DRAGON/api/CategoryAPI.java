package com.DRAGON.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DRAGON.model.AccountModel;
import com.DRAGON.model.CategoryModel;
import com.DRAGON.service.ICategoryService;
import com.DRAGON.utils.HttpUtil;
import com.DRAGON.utils.SessionUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(urlPatterns = { "/api-category" })
public class CategoryAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	ICategoryService categoryService;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		CategoryModel categoryModel = HttpUtil.of(request.getReader()).toModel(CategoryModel.class);
		AccountModel accountModel = (AccountModel) SessionUtil.getInstance().getValue(request, "ACCOUNTMODEL");
		categoryModel.setCreatedBy(accountModel.getUserName());
		categoryModel = categoryService.add(categoryModel);
		mapper.writeValue(response.getOutputStream(), categoryModel);
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		CategoryModel updateCategory = HttpUtil.of(request.getReader()).toModel(CategoryModel.class);
		AccountModel accountModel = (AccountModel) SessionUtil.getInstance().getValue(request, "ACCOUNTMODEL");
		updateCategory.setModifiedBy(accountModel.getUserName());
		updateCategory = categoryService.edit(updateCategory);
		mapper.writeValue(response.getOutputStream(), updateCategory);
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		CategoryModel categoryModel = HttpUtil.of(request.getReader()).toModel(CategoryModel.class);
		categoryService.delete(categoryModel.getId());
		categoryService.resetIdentity();
		mapper.writeValue(response.getOutputStream(), "{}");
	}
}
