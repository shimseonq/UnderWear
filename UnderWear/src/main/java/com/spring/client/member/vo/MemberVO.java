package com.spring.client.member.vo;

import java.sql.Timestamp;

import com.spring.client.login.vo.LoginVO;

public class MemberVO extends LoginVO {
	private String oldUserPw; // 새롭게 부여할 비밀번호 전의 사용비밀번호 c_oldUserPw
	private String c_birth; // 회원 테이블 생년월일 c_birth
	private String c_email; // 회원 이메일 c_email
	private String c_phone; // 회원 전화번호 c_phone
	private Timestamp c_date; // 회원 등록일 c_date
	private String c_address; //회원 집주소

	public String getOldUserPw() {
		return oldUserPw;
	}

	public void setOldUserPw(String oldUserPw) {
		this.oldUserPw = oldUserPw;
	}

	public String getC_birth() {
		return c_birth;
	}

	public void setC_birth(String c_birth) {
		this.c_birth = c_birth;
	}

	public String getC_email() {
		return c_email;
	}

	public void setC_email(String c_email) {
		this.c_email = c_email;
	}

	public String getC_phone() {
		return c_phone;
	}

	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}

	public Timestamp getC_date() {
		return c_date;
	}

	public void setC_date(Timestamp c_date) {
		this.c_date = c_date;
	}

	public String getC_address() {
		return c_address;
	}

	public void setC_address(String c_address) {
		this.c_address = c_address;
	}

	@Override
	public String toString() {
		return "MemberVO [oldUserPw=" + oldUserPw + ", c_birth=" + c_birth + ", c_email=" + c_email + ", c_phone="
				+ c_phone + ", c_date=" + c_date + ", c_address=" + c_address + "]";
	}

		

}