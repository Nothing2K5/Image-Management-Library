package com.DRAGON.service.impl;

import java.io.BufferedInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.inject.Inject;

import com.DRAGON.dao.IImageDAO;
import com.DRAGON.model.ImageModel;
import com.DRAGON.paging.Pageable;
import com.DRAGON.service.IImageService;

public class ImageService implements IImageService {

	@Inject
	private IImageDAO imageDAO;

	@Override
	public List<ImageModel> findAll() {
		return imageDAO.findAll();
	}

	@Override
	public List<ImageModel> findAllByCateId(Integer cateId) {
		return imageDAO.findAllByCateId(cateId);
	}

	@Override
	public List<ImageModel> findAllByName(String name) {
		return imageDAO.findAllByName(name);
	}

	@Override
	public List<ImageModel> findAllByPageable(Pageable pageable) {
		return imageDAO.findAllByPageable(pageable);
	}

	@Override
	public ImageModel findOne(Integer id) {
		return imageDAO.findOne(id);
	}

	@Override
	public Integer getTotalItem() {
		return imageDAO.getTotalItem();
	}

	@Override
	public Integer getMaxId() {
		return imageDAO.getMaxId();
	}

	@Override
	public ImageModel add(ImageModel imageModel) {
		// Su dung neu khongdung GETDATE() trong sql server
		// imageModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		Integer id = imageDAO.add(imageModel);
		return imageDAO.findOne(id);
	}

	@Override
	public ImageModel edit(ImageModel updateImage) {
		ImageModel oldImage = imageDAO.findOne(updateImage.getId());
		// Su dung neu khongdung GETDATE() trong sql server
		// updateImage.setCreatedDate(oldImage.getCreatedDate());
		// updateImage.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		updateImage.setCreatedBy(oldImage.getCreatedBy());
		imageDAO.edit(updateImage);
		return imageDAO.findOne(updateImage.getId());
	}

	@Override
	public void delete(Integer id) {
		imageDAO.delete(id);
	}

	@Override
	public void resetIdentity() {
		imageDAO.resetIdentity();
	}

	@Override
	public Integer download(ImageModel imageModel) {
		HttpURLConnection connection = null;
		try {
			URL url = new URL(imageModel.getImage());
			connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setConnectTimeout(5000); // 5 seconds
			connection.setReadTimeout(5000); // 5 seconds
			int status = connection.getResponseCode();
			if (status == HttpURLConnection.HTTP_OK) {
	            String os = System.getProperty("os.name").toLowerCase();
	            String userHome = System.getProperty("user.home");
	            Path downloadPath;

	            //Tao duong dan phu hop voi he dieu hanh
	            if (os.contains("win")) {
	                downloadPath = Paths.get(userHome, "Downloads", imageModel.getName() + ".jpg");
	            } else if (os.contains("nix") || os.contains("nux")) {
	                downloadPath = Paths.get(userHome, "Downloads", imageModel.getName() + ".jpg");
	            } else if (os.contains("mac")) {
	                downloadPath = Paths.get(userHome, "Downloads", imageModel.getName() + ".jpg");
	            } else {
	                //Null neu khong xac dinh duoc he dieu hanh
	                downloadPath = null;
	            }
				try (InputStream in = new BufferedInputStream(connection.getInputStream());
					FileOutputStream out = new FileOutputStream(downloadPath.toFile())) {
						byte[] dataBuffer = new byte[1024];
						int bytesRead;
						while ((bytesRead = in.read(dataBuffer, 0, 1024)) != -1) {
							out.write(dataBuffer, 0, bytesRead);
					}
					System.out.println("Image downloaded successfully: " + imageModel.getName());
					return imageModel.getId();
				}
			} else {
				System.err.println("Server returned non-OK status: " + status);
				return null;
			}
		} catch (FileNotFoundException e) {
			System.err.println("File not found: " + e.getMessage());
			return null;
		} catch (ConnectException e) {
			System.err.println("Connection refused: " + e.getMessage());
			return null;
		} catch (IOException e) {
			System.err.println("Error downloading image: " + e.getMessage());
			return null;
		} finally {
			if (connection != null) {
				connection.disconnect();
			}
		}
	}
}
