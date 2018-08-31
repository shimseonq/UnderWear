package com.spring.client.login.vo;

public class LoginVO extends LoginHistory {
	private String c_id = ""; //유저 id  c_id
	private String c_pwd = "";	//유저 비밀번호 c_pwd
	private String c_name = ""; //유저 네임 c_name

	private int c_num = 0; //유저 번호


	public LoginVO() {
	}
	
	public LoginVO(String c_id, String c_pwd, String c_name, int c_num) {
		super();
		this.c_id = c_id;
		this.c_pwd = c_pwd;
		this.c_name = c_name;
		this.c_num = c_num;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getC_pwd() {
		return c_pwd;
	}

	public void setC_pwd(String c_pwd) {
		this.c_pwd = c_pwd;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
}