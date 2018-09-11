package com.spring.admin.product.vo;

import com.spring.admin.image.vo.AdminImageVO;

public class AdminProductVO extends AdminImageVO {

	private int p_code			= 0;		// 상품 코드
	private String p_name		= "";		// 상품 이름
	private int p_inventory 	= 0;		// 상품 재고량
	private String p_color		= "";		// 상품 색상
	private String p_size 		= "";		// 상품 사이즈
	private String p_date		= "";		// 상품 등록일
	private String p_content	= "";		// 상품 설명
	private String p_gender		= "";		// 상품 성별
	private String p_image		= "";		// 썸네일
	
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
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_content() {
		return p_content;
	}
	public String getP_gender() {
		return p_gender;
	}
	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	
	@Override
	public String toString() {
		return "AdminProductVO [p_code=" + p_code + ", p_name=" + p_name + ", p_inventory=" + p_inventory + ", p_color="
				+ p_color + ", p_size=" + p_size + ", p_date=" + p_date + ", p_content=" + p_content + ", p_gender="
				+ p_gender + ", getImg_no()=" + getImg_no() + ", getFiles()=" + getFiles() + ", getImg_image()="
				+ getImg_image() + ", getSearch()=" + getSearch() + ", getKeyword()=" + getKeyword()
				+ ", getStart_date()=" + getStart_date() + ", getEnd_date()=" + getEnd_date() + ", getBigct_no()="
				+ getBigct_no() + ", getBigct_category()=" + getBigct_category() + ", getPr_no()=" + getPr_no()
				+ ", getPr_01()=" + getPr_01() + ", getSmallct_no()=" + getSmallct_no() + ", getSmallct_category()="
				+ getSmallct_category() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
}
