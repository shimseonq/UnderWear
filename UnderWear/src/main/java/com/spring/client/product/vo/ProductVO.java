package com.spring.client.product.vo;

public class ProductVO {

	private int p_code			= 0;
	private String p_name		= "";
	private int p_inventory 	= 0;
	private String p_color		= "";
	private String p_size 		= "";
	private String p_date		= "";
	private String p_feature	= "";
	private String p_gender		= "";
	
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_inventory() {
		return p_inventory;
	}
	public void setP_inventory(int p_inventory) {
		this.p_inventory = p_inventory;
	}
	public String getP_color() {
		return p_color;
	}
	public void setP_color(String p_color) {
		this.p_color = p_color;
	}
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public String getP_feature() {
		return p_feature;
	}
	public void setP_feature(String p_feature) {
		this.p_feature = p_feature;
	}
	public String getP_gender() {
		return p_gender;
	}
	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}
	
}
