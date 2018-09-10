package com.spring.client.pay.vo;

import com.spring.client.order.vo.OrderVO;

public class PayVO extends OrderVO{
	private int pa_no;
	private String pa_payway = "";
	private String pa_date;
	
	public int getPa_no() {
		return pa_no;
	}
	public void setPa_no(int pa_no) {
		this.pa_no = pa_no;
	}
	public String getPa_payway() {
		return pa_payway;
	}
	public void setPa_payway(String pa_payway) {
		this.pa_payway = pa_payway;
	}
	public String getPa_date() {
		return pa_date;
	}
	public void setPa_date(String pa_date) {
		this.pa_date = pa_date;
	}
	
}
