package com.spring.client.member.vo;

import com.spring.client.product.vo.ProductVO;

public class MemberSecurity extends ProductVO{ 
    private String c_id;		//유저 아이디
    private String salt;		

	public MemberSecurity() { }

	public MemberSecurity(String c_id, String salt) {
		super();
		this.c_id = c_id;
		this.salt = salt;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	@Override
	public String toString() {
		return "MemberSecurity [c_id=" + c_id + ", salt=" + salt + "]";
	}
	
}