package com.DRAGON.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DRAGON.model.AccountModel;
import com.DRAGON.model.ImageModel;
import com.DRAGON.service.IImageService;
import com.DRAGON.utils.HttpUtil;
import com.DRAGON.utils.SessionUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(urlPatterns = { "/api-image" })
public class ImageAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	IImageService imageService;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");// Set UTF-8 cho data tu client tra ve server
		response.setContentType("application/json");// Set application/json cho data tu server tra ve client
		ImageModel imageModel = HttpUtil.of(request.getReader()).toModel(ImageModel.class);
		if (imageModel.getAccountId() == null) {
			Integer id = imageService.download(imageModel);
			mapper.writeValue(response.getOutputStream(), id);
		} else {
			AccountModel accountModel = (AccountModel) SessionUtil.getInstance().getValue(request, "ACCOUNTMODEL");
			imageModel.setCreatedBy(accountModel.getUserName());
			imageModel = imageService.add(imageModel);
			mapper.writeValue(response.getOutputStream(), imageModel);// Ghi doi tuong imageModel duoi dang JSON vao //
																		// luong phan hoi de gui lai cho client
		}
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");// Set UTF-8 cho data tu client tra ve server
		response.setContentType("application/json");// Set application/json cho data tu server tra ve client
		ImageModel updateImage = HttpUtil.of(request.getReader()).toModel(ImageModel.class);
		AccountModel accountModel = (AccountModel) SessionUtil.getInstance().getValue(request, "ACCOUNTMODEL");
		updateImage.setModifiedBy(accountModel.getUserName());
		updateImage = imageService.edit(updateImage);
		mapper.writeValue(response.getOutputStream(), updateImage);
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");// Set UTF-8 cho data tu client tra ve server
		response.setContentType("application/json");// Set application/json cho data tu server tra ve client
		ImageModel imageModel = HttpUtil.of(request.getReader()).toModel(ImageModel.class);
		imageService.delete(imageModel.getId());
		imageService.resetIdentity();
		mapper.writeValue(response.getOutputStream(), "{}");
	}
}
