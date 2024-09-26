package com.DRAGON.model;

public class CategoryModel extends AbstractModel<CategoryModel> {
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "CategoryModel [name=" + name + "]";
	}

}
