package com.DRAGON.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DRAGON.model.ImageModel;
import com.DRAGON.service.ICategoryService;
import com.DRAGON.service.IImageService;
import com.DRAGON.utils.FormUtil;

@WebServlet(urlPatterns = { "/view" })
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	ICategoryService categoryService;

	@Inject
	IImageService imageService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer id = FormUtil.toModel(ImageModel.class, request).getId();
		if (id != null) {
			request.setAttribute("listCategory", categoryService.findAll());
			request.setAttribute("image", imageService.findOne(id));
			RequestDispatcher rd = request.getRequestDispatcher("/views/view.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/home");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
