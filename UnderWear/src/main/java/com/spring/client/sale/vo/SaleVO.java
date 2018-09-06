package com.spring.client.sale.vo;

import com.spring.client.pay.vo.PayVO;

public class SaleVO extends PayVO{
	private int sa_no;
	private int sa_money;
	private String sa_date;
	
	public int getSa_no() {
		return sa_no;
	}
	public void setSa_no(int sa_no) {
		this.sa_no = sa_no;
	}
	public int getSa_money() {
		return sa_money;
	}
	public void setSa_money(int sa_money) {
		this.sa_money = sa_money;
	}
	public String getSa_date() {
		return sa_date;
	}
	public void setSa_date(String sa_date) {
		this.sa_date = sa_date;
	}
	
}
