package com.spring.client.order.vo;

import com.spring.client.member.basket.vo.BasketVO;

public class OrderVO extends BasketVO {
	
	private int o_no;
	private String o_date;
	private String o_delivery;
	private String o_comment;
	private String o_deliveryname;
	private String o_deliveryphone;
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
	public String getO_comment() {
		return o_comment;
	}
	public void setO_comment(String o_comment) {
		this.o_comment = o_comment;
	}
	public String getO_deliveryaddress() {
		return o_deliveryaddress;
	}
	public void setO_deliveryaddress(String o_deliveryaddress) {
		this.o_deliveryaddress = o_deliveryaddress;
	}
	public String getO_deliveryname() {
		return o_deliveryname;
	}
	public void setO_deliveryname(String o_deliveryname) {
		this.o_deliveryname = o_deliveryname;
	}
	public String getO_deliveryphone() {
		return o_deliveryphone;
	}
	public void setO_deliveryphone(String o_deliveryphone) {
		this.o_deliveryphone = o_deliveryphone;
	}
	
}
