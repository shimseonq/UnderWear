package com.spring.client.member.rank.vo;

public class RankVO {
	private int rk_no;
	private String rk_rank ="";
	private int rk_standard;
	private String rk_discount ="";
	private String c_id="";

	public int getRk_no() {
		return rk_no;
	}
	public void setRk_no(int rk_no) {
		this.rk_no = rk_no;
	}
	public String getRk_rank() {
		return rk_rank;
	}
	public void setRk_rank(String rk_rank) {
		this.rk_rank = rk_rank;
	}
	public int getRk_standard() {
		return rk_standard;
	}
	public void setRk_standard(int rk_standard) {
		this.rk_standard = rk_standard;
	}
	public String getRk_discount() {
		return rk_discount;
	}
	public void setRk_discount(String rk_discount) {
		this.rk_discount = rk_discount;
	}
	
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	
}
