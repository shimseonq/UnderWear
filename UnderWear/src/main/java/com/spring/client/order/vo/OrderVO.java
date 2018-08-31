package com.spring.client.order.vo;

import com.spring.client.member.basket.vo.BasketVO;

public class OrderVO extends BasketVO {
	
	private int o_no;
	private String o_date;
	private String o_delivery;
	private String o_warning;
	private String o_delivaryname;
	private String o_delivaryphone;
	private String o_deliveryaddress;
	
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public String getO_delivery() {
		return o_delivery;
	}
	public void setO_delivery(String o_delivery) {
		this.o_delivery = o_delivery;
	}
	public String getO_warning() {
		return o_warning;
	}
	public void setO_warning(String o_warning) {
		this.o_warning = o_warning;
	}
	public String getO_delivaryname() {
		return o_delivaryname;
	}
	public void setO_delivaryname(String o_delivaryname) {
		this.o_delivaryname = o_delivaryname;
	}
	public String getO_delivaryphone() {
		return o_delivaryphone;
	}
	public void setO_delivaryphone(String o_delivaryphone) {
		this.o_delivaryphone = o_delivaryphone;
	}
	public String getO_deliveryaddress() {
		return o_deliveryaddress;
	}
	public void setO_deliveryaddress(String o_deliveryaddress) {
		this.o_deliveryaddress = o_deliveryaddress;
	}
	
}
