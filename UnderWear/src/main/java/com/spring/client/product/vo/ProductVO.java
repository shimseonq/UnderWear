package com.spring.client.product.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.common.vo.CommonVO;

public class ProductVO extends CommonVO {

	private int p_code			= 0;		// ��ǰ �ڵ�
	private String p_name		= "";		// ��ǰ �̸�
	private int p_inventory 	= 0;		// ��ǰ �����
	private String p_color		= "";		// ��ǰ ����
	private String p_size 		= "";		// ��ǰ ������
	private String p_date		= "";		// ��ǰ �����
	private String p_content	= "";		// ��ǰ ����
	private String p_gender		= "";		// ��ǰ ����
	
	// ���� ���ε带 ���� �ʵ�
	private MultipartFile file;		// ÷�� ����
	private String p_file;			// ���� ������ ������ ���ϸ�
	
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
	public String getP_gender() {
		return p_gender;
	}
	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getP_file() {
		return p_file;
	}
	public void setP_file(String p_file) {
		this.p_file = p_file;
	}
	
	
	
}