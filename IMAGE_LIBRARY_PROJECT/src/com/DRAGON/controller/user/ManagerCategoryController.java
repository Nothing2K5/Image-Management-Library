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
import com.DRAGON.model.CategoryModel;
import com.DRAGON.paging.PageRequest;
import com.DRAGON.paging.Pageable;
import com.DRAGON.service.ICategoryService;
import com.DRAGON.sort.Sorter;
import com.DRAGON.utils.FormUtil;

@WebServlet(urlPatterns = { "/user-manager-category" })
public class ManagerCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private ICategoryService categoryService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryModel categoryModel = FormUtil.toModel(CategoryModel.class, request);
		String message = request.getParameter("message");
		request.setAttribute("message", message);
		String view = "";
		if (categoryModel.getType().equals(SystemConstant.LIST)) {
			Pageable pageable = new PageRequest(categoryModel.getPage(), categoryModel.getMaxPageItem(),
					new Sorter(categoryModel.getSortName(), categoryModel.getSortBy()));

			categoryModel.setListResult(categoryService.findAllByPageable(pageable));
			categoryModel.setTotalItem(categoryService.getTotalItem());
			categoryModel.setTotalPage((int) Math.ceil((double) categoryModel.getTotalItem() / categoryModel.getMaxPageItem()));
			view = "/views/managerCategory.jsp";
		} else if (categoryModel.getType().equals(SystemConstant.EDIT)) {
			if (categoryModel.getId() != null) {
				categoryModel = categoryService.findOne(categoryModel.getId());
				view = "/views/editCategory.jsp";
			}
		}
		request.setAttribute("listCategory", categoryService.findAll());
		request.setAttribute("category", categoryModel);

		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
