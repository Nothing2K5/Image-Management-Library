package com.DRAGON.controller.user;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DRAGON.constant.SystemConstant;
import com.DRAGON.model.ImageModel;
import com.DRAGON.paging.PageRequest;
import com.DRAGON.paging.Pageable;
import com.DRAGON.service.ICategoryService;
import com.DRAGON.service.IImageService;
import com.DRAGON.sort.Sorter;
import com.DRAGON.utils.FormUtil;

@WebServlet(urlPatterns = { "/user-manager-image" })
public class ManagerImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private ICategoryService categoryService;

	@Inject
	private IImageService imageService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ImageModel imageModel = FormUtil.toModel(ImageModel.class, request);
		String message = request.getParameter("message");
		request.setAttribute("message", message);
		String view = "/views/collection.jsp";
		if (imageModel.getType().equals(SystemConstant.LIST)) {
			Pageable pageable = new PageRequest(imageModel.getPage(), imageModel.getMaxPageItem(),
					new Sorter(imageModel.getSortName(), imageModel.getSortBy()));

			imageModel.setListResult(imageService.findAllByPageable(pageable));
			imageModel.setTotalItem(imageService.getTotalItem());
			imageModel.setTotalPage((int) Math.ceil((double) imageModel.getTotalItem() / imageModel.getMaxPageItem()));
			view = "/views/managerImage.jsp";
		} else if (imageModel.getType().equals(SystemConstant.EDIT)) {
			if (imageModel.getId() != null) {
				imageModel = imageService.findOne(imageModel.getId());
				view = "/views/editImage.jsp";
			}
		}
		request.setAttribute("listCategory", categoryService.findAll());
		request.setAttribute("image", imageModel);

		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
