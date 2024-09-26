package com.DRAGON.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DRAGON.model.AlbumModel;
import com.DRAGON.model.ImageModel;
import com.DRAGON.service.IAlbumService;
import com.DRAGON.service.ICategoryService;
import com.DRAGON.service.IImageService;
import com.DRAGON.utils.FormUtil;

@WebServlet(urlPatterns = { "/explore" })
public class ExploreController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	ICategoryService categoryService;

	@Inject
	IImageService imageService;
	
	@Inject
	IAlbumService albumService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ImageModel imageModel = FormUtil.toModel(ImageModel.class, request);
		AlbumModel  albumModel = FormUtil.toModel(AlbumModel.class, request);
		request.setAttribute("listCategory", categoryService.findAll());
		request.setAttribute("listImage", imageService.findAll());
		request.setAttribute("listAlbum", albumService.findAll());
		if (imageModel.getCateId() != null) {
			request.setAttribute("tagCategory", categoryService.findOne(imageModel.getCateId()));
			request.setAttribute("listImage", imageService.findAllByCateId(imageModel.getCateId()));
		} else if (imageModel.getName() != null) {
			request.setAttribute("tagSearch", imageModel.getName());
			request.setAttribute("listImage", imageService.findAllByName(imageModel.getName()));
		} else if (albumModel.getId() != null) {
			request.setAttribute("tagAlbum", albumService.findOne(albumModel.getId()));
			//request.setAttribute("listAlbum", albumService.findAllByCateId(albumModel.getId()));
		}
		RequestDispatcher rd = request.getRequestDispatcher("/views/collection.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
