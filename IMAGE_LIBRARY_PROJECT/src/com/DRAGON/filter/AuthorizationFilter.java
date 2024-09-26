package com.DRAGON.filter;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DRAGON.constant.SystemConstant;
import com.DRAGON.model.AccountModel;
import com.DRAGON.service.IRoleService;
import com.DRAGON.utils.SessionUtil;

public class AuthorizationFilter implements Filter {

	@Inject
	IRoleService roleService;
	
	@SuppressWarnings("unused")
	private ServletContext context;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext();
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		String url = request.getRequestURI();
		if (url.startsWith(request.getContextPath() + "/admin")) {
			AccountModel accountModel = (AccountModel) SessionUtil.getInstance().getValue(request, "ACCOUNTMODEL");
			if (accountModel != null) {
				if (roleService.findOne(accountModel.getRoleId()).getCode().equals(SystemConstant.ADMIN)) {
					filterChain.doFilter(servletRequest, servletResponse);
				} else if (roleService.findOne(accountModel.getRoleId()).getCode().equals(SystemConstant.USER)) {
					response.sendRedirect(request.getContextPath() + "/login?action=login&message=not_permission");
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/login?action=login&message=not_login");
			}
		}else if(url.startsWith(request.getContextPath() + "/user")) {
			AccountModel accountModel = (AccountModel) SessionUtil.getInstance().getValue(request, "ACCOUNTMODEL");
			if (accountModel != null) {
				if (roleService.findOne(accountModel.getRoleId()).getCode().equals(SystemConstant.ADMIN)) {
					filterChain.doFilter(servletRequest, servletResponse);
				}else if (roleService.findOne(accountModel.getRoleId()).getCode().equals(SystemConstant.USER)) {
					filterChain.doFilter(servletRequest, servletResponse);
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/login?action=login&message=not_login");
			}
		}else {
			filterChain.doFilter(servletRequest, servletResponse);
		}
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
