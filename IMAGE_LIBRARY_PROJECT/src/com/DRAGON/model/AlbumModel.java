package com.DRAGON.model;

public class AlbumModel extends AbstractModel<AlbumModel> {
	private String name;
	private String description;
	private Integer coverImageId;
	private String privacyStatus;
	private Integer accountId;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getCoverImageId() {
		return coverImageId;
	}

	public void setCoverImageId(Integer coverImageId) {
		this.coverImageId = coverImageId;
	}

	public String getPrivacyStatus() {
		return privacyStatus;
	}

	public void setPrivacyStatus(String privacyStatus) {
		this.privacyStatus = privacyStatus;
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	@Override
	public String toString() {
		return "AlbumModel [name=" + name + ", description=" + description + ", coverImageId=" + coverImageId
				+ ", privacyStatus=" + privacyStatus + ", accountId=" + accountId + "]";
	}
	
	

}
