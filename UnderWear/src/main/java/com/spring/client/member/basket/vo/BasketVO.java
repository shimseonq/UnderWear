package com.spring.client.member.basket.vo;

import com.spring.client.member.vo.MemberVO;
import com.spring.client.product.vo.ProductVO;

public class BasketVO extends MemberVO {
	private int b_no;  
	private int b_count = 0;
	private int total= 0;
	private int paytotal = 0;
	private double paysale =0;
	private int b_status = 0;
	
	public int getPaytotal() {
		return paytotal;
	}
	public void setPaytotal(int paytotal) {
		this.paytotal = paytotal;
	}
	public double getPaysale() {
		return paysale;
	}
	public void setPaysale(double sale) {
		this.paysale = sale;
	}
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
	public int getB_status() {
		return b_status;
	}
	public void setB_status(int b_status) {
		this.b_status = b_status;
	}
	
}
