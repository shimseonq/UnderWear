package com.spring.client.member.rank.vo;

public class RankVO {
	private int rk_num;
	private String rk_rank ="";
	private int rk_standard;
	private String rk_discount ="";
	
	public int getRk_num() {
		return rk_num;
	}
	public void setRk_num(int rk_num) {
		this.rk_num = rk_num;
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
}
