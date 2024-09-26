package com.DRAGON.model;

public class AccountModel extends AbstractModel<AccountModel> {
	private String fullName;
	private String userName;
	private String password;
	private Integer roleId;

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	@Override
	public String toString() {
		return "AccountModel [fullName=" + fullName + ", userName=" + userName + ", password=" + password + ", roleId="
				+ roleId + "]";
	}

}
