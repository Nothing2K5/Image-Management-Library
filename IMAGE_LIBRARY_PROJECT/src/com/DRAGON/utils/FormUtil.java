package com.DRAGON.utils;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;

public class FormUtil {

	public static <T> T toModel(Class<T> classUtil, HttpServletRequest request) {
		T object = null;
		try {
			object = classUtil.newInstance();
			BeanUtils.populate(object, request.getParameterMap());
		} catch (InstantiationException | IllegalAccessException | InvocationTargetException e) {
			System.out.println(e.getMessage());
		}
		return object;
	}
}
