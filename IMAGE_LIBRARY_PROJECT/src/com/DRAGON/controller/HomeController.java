package com.DRAGON.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DRAGON.constant.SystemConstant;
import com.DRAGON.model.AccountModel;
import com.DRAGON.service.IAccountService;
import com.DRAGON.service.IAlbumService;
import com.DRAGON.service.ICategoryService;
import com.DRAGON.service.IImageService;
import com.DRAGON.service.IRoleService;
import com.DRAGON.utils.FormUtil;
import com.DRAGON.utils.SessionUtil;

@WebServlet(urlPatterns = { "/home", "/login", "/sign-up", "/logout" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	ICategoryService categoryService;

	@Inject
	IImageService imageService;

	@Inject
	IAccountService accountService;

	@Inject
	IRoleService roleService;
	
	@Inject
	IAlbumService albumService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String message = request.getParameter("message");
		request.setAttribute("message", message);
		if (action != null && action.equals("logout")) {
			SessionUtil.getInstance().removeValue(request, "ACCOUNTMODEL");
			response.sendRedirect(request.getContextPath() + "/home?message=logout_success");
		} else {
			request.setAttribute("listCategory", categoryService.findAll());
			request.setAttribute("listImage", imageService.findAll());
			request.setAttribute("listAlbum", albumService.findAll());
			RequestDispatcher rd = request.getRequestDispatcher("/views/collection.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null && action.equals("login")) {
			AccountModel accountModel = FormUtil.toModel(AccountModel.class, request);
			accountModel = accountService.findByUserNameAndPassword(accountModel.getUserName(), accountModel.getPassword());
			if (accountModel != null) {
				SessionUtil.getInstance().putValue(request, "ACCOUNTMODEL", accountModel);
				if (roleService.findOne(accountModel.getRoleId()).getCode().equals(SystemConstant.ADMIN)) {
					response.sendRedirect(request.getContextPath() + "/home?message=login_success");
				} else if (roleService.findOne(accountModel.getRoleId()).getCode().equals(SystemConstant.USER)) {
					response.sendRedirect(request.getContextPath() + "/home?message=login_success");
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/login?action=login&message=login_failed");
			}
		} else if (action != null && action.equals("signUp")) {
			AccountModel accountModel = FormUtil.toModel(AccountModel.class, request);
			boolean check = accountService.checkByUserName(accountModel.getUserName());
			if (check == true) {
				if (accountService.checkByRePassword(request.getParameter("rePassword"), accountModel.getPassword())) {
					accountService.signUp(accountModel);
					response.sendRedirect(request.getContextPath() + "/sign-up?action=signUp&message=sign_up_success");
				} else {
					response.sendRedirect(request.getContextPath() + "/sign-up?action=signUp&message=sign_up_failed_re_password");
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/sign-up?action=signUp&message=sign_up_failed_user_name_exists");
			}
		}
	}

}
