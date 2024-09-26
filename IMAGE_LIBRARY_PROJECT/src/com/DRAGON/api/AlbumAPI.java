package com.DRAGON.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DRAGON.model.AlbumModel;
import com.DRAGON.service.IAlbumService;
import com.DRAGON.utils.HttpUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(urlPatterns = { "/api-album" })
public class AlbumAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	IAlbumService albumService;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		AlbumModel albumModel = HttpUtil.of(request.getReader()).toModel(AlbumModel.class);
		albumModel = albumService.create(albumModel);
		mapper.writeValue(response.getOutputStream(), albumModel);
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		AlbumModel updateAlbum = HttpUtil.of(request.getReader()).toModel(AlbumModel.class);
		updateAlbum = albumService.edit(updateAlbum);
		mapper.writeValue(response.getOutputStream(), updateAlbum);
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");// Set UTF-8 cho data tu client tra ve server
		response.setContentType("application/json");// Set application/json cho data tu server tra ve client
		AlbumModel albumModel = HttpUtil.of(request.getReader()).toModel(AlbumModel.class);
		albumService.delete(albumModel.getId());
		albumService.resetIdentity();
		mapper.writeValue(response.getOutputStream(), "{}");
	}
}
