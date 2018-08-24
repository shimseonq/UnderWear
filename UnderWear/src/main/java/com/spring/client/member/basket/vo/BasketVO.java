package com.spring.client.member.basket.vo;

import com.spring.client.product.vo.ProductVO;

public class BasketVO extends ProductVO {
	private int b_no;
	private int b_count = 0;
	private String img_01 = "";
	private int total= 0;
	
	public int getB_no() {
		return b_no;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	public String getImg_01() {
		return img_01;
	}
	public void setImg_01(String img_01) {
		this.img_01 = img_01;
	}
}
