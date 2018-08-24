package com.spring.client.member.vo;

import java.sql.Timestamp;

import com.spring.client.login.vo.LoginVO;

public class MemberVO extends LoginVO {
	private String oldUserPw; 	//새롭게 부여할 비밀번호 전의 사용비밀번호
	private String pinno;		//회원 테이블 생년월일
	private String email;		//회원 이메일
	private String phone;		//회원 전화번호
	private Timestamp joinDate;		//회원 등록일
	private String my_rank = "";	//회원 등급
	private int c_num;
	
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getMy_rank() {
		return my_rank;
	}
	public void setMy_rank(String my_rank) {
		this.my_rank = my_rank;
	}
	public String getOldUserPw() {
		return oldUserPw;
	}

	public void setOldUserPw(String oldUserPw) {
		this.oldUserPw = oldUserPw;
	}

	public String getPinno() {
		return pinno;
	}

	public void setPinno(String pinno) {
		this.pinno = pinno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Timestamp getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "MemberVO [oldUserPw=" + oldUserPw + ", pinno=" + pinno + ", email=" + email + ", phone=" + phone
				+ ", joinDate=" + joinDate + "]";
	}

}
