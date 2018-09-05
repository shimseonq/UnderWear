package com.spring.admin.login.vo;

public class AdminLoginVO extends AdminLoginHistory {
	private String userId = "";
	private String userPw = "";
	private String userName = "";
	private int a_num = 0; // À¯Àú ¹ö³ó

	public AdminLoginVO() {
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getA_num() {
		return a_num;
	}

	public void setA_num(int a_num) {
		this.a_num = a_num;
	}

	public AdminLoginVO(String userId, String userPw, String userName, int a_num) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.a_num = a_num;
	}

	@Override
	public String toString() {
		return "AdminLoginVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", a_num=" + a_num
				+ "]";
	}

}
