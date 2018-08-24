package com.spring.client.member.vo;

import java.sql.Timestamp;

import com.spring.client.login.vo.LoginVO;

public class MemberVO extends LoginVO {
	private String oldUserPw; 	//���Ӱ� �ο��� ��й�ȣ ���� ����й�ȣ
	private String pinno;		//ȸ�� ���̺� �������
	private String email;		//ȸ�� �̸���
	private String phone;		//ȸ�� ��ȭ��ȣ
	private Timestamp joinDate;		//ȸ�� �����
	private String my_rank = "";	//ȸ�� ���
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
