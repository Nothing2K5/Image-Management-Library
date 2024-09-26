package com.DRAGON.model;

public class ImageModel extends AbstractModel<ImageModel> {
	private String name;
	private String image;
	private String description;
	private Integer cateId;
	private Integer accountId;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getCateId() {
		return cateId;
	}

	public void setCateId(Integer cateId) {
		this.cateId = cateId;
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	@Override
	public String toString() {
		return "ImageModel [name=" + name + ", image=" + image + ", description=" + description + ", cateId=" + cateId
				+ ", accountId=" + accountId + "]";
	}

}
