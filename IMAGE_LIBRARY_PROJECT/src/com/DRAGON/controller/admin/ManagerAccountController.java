package com.DRAGON.controller.admin;

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
import com.DRAGON.paging.PageRequest;
import com.DRAGON.paging.Pageable;
import com.DRAGON.service.IAccountService;
import com.DRAGON.service.ICategoryService;
import com.DRAGON.service.IRoleService;
import com.DRAGON.sort.Sorter;
import com.DRAGON.utils.FormUtil;

@WebServlet(urlPatterns = { "/admin-manager-account" })
public class ManagerAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private ICategoryService categoryService;

	@Inject
	private IAccountService accountService;

	@Inject
	private IRoleService roleService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AccountModel accountModel = FormUtil.toModel(AccountModel.class, request);
		String message = request.getParameter("message");
		request.setAttribute("message", message);
		String view = "";
		if (accountModel.getType().equals(SystemConstant.LIST)) {
			Pageable pageable = new PageRequest(accountModel.getPage(), accountModel.getMaxPageItem(),
					new Sorter(accountModel.getSortName(), accountModel.getSortBy()));

			accountModel.setListResult(accountService.findAllByPageable(pageable));
			accountModel.setTotalItem(accountService.getTotalItem());
			accountModel.setTotalPage(
					(int) Math.ceil((double) accountModel.getTotalItem() / accountModel.getMaxPageItem()));
			view = "/views/managerAccount.jsp";
		} else if (accountModel.getType().equals(SystemConstant.EDIT)) {
			if (accountModel.getId() != null) {
				accountModel = accountService.findOne(accountModel.getId());
				view = "/views/editAccount.jsp";
			}
		}
		request.setAttribute("listCategory", categoryService.findAll());
		request.setAttribute("listRole", roleService.findAll());
		request.setAttribute("account", accountModel);

		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
