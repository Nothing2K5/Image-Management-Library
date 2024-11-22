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
import com.DRAGON.model.AlbumModel;
import com.DRAGON.paging.PageRequest;
import com.DRAGON.paging.Pageable;
import com.DRAGON.service.IAlbumService;
import com.DRAGON.service.ICategoryService;
import com.DRAGON.sort.Sorter;
import com.DRAGON.utils.FormUtil;

@WebServlet(urlPatterns = { "/user-manager-album" })
public class ManagerAlbumController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private ICategoryService categoryService;

	@Inject
	private IAlbumService albumService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AlbumModel albumModel = FormUtil.toModel(AlbumModel.class, request);
		String message = request.getParameter("message");
		request.setAttribute("message", message);
		String view = "/views/collection.jsp";
		if (albumModel.getType().equals(SystemConstant.LIST)) {
			Pageable pageable = new PageRequest(albumModel.getPage(), albumModel.getMaxPageItem(),
					new Sorter(albumModel.getSortName(), albumModel.getSortBy()));

			albumModel.setListResult(albumService.findAllByPageable(pageable));
			albumModel.setTotalItem(albumService.getTotalItem());
			albumModel.setTotalPage((int) Math.ceil((double) albumModel.getTotalItem() / albumModel.getMaxPageItem()));
			view = "/views/managerAlbum.jsp";
		} else if (albumModel.getType().equals(SystemConstant.EDIT)) {
			if (albumModel.getId() != null) {
				albumModel = albumService.findOne(albumModel.getId());
				view = "/views/editAlbum.jsp";
			}
		}
		request.setAttribute("listCategory", categoryService.findAll());
		request.setAttribute("album", albumModel);

		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
