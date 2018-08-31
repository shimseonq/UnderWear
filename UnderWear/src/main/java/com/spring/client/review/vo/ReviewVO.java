package com.spring.client.review.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.client.login.vo.LoginVO;

public class ReviewVO extends LoginVO {
	private int rv_no	=	0;		//���� �Խ��� ��ȣ
	private String rv_title = "";	//���� �Խ��� ���� 
	private String rv_content = "";	//���� �Խ���  ����
	private String rv_date = "";	//���� �Խ��� �ۼ���
	private int rv_hit = 0;			//���� �Խ��� ��ȸ��
	private MultipartFile rv_imgfile;	//���� �Խ��� ÷������ 
	private String rv_img;				//���� �Խ��� ���� ������ ������ ���ϸ� 	,== b_file
	
	
	/*------------------------- common VO -----------------------------*/
	//���� �˻� �� ����� �ʵ�
	private String search = "";
	private String keyword = "";
	private String start_date ="";
	private String end_date = "";
	
	
	public int getRv_no() {
		return rv_no;
	}
	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}
	public String getRv_title() {
		return rv_title;
	}
	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}
	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public String getRv_date() {
		return rv_date;
	}
	public void setRv_date(String rv_date) {
		this.rv_date = rv_date;
	}
	public int getRv_hit() {
		return rv_hit;
	}
	public void setRv_hit(int rv_hit) {
		this.rv_hit = rv_hit;
	}
	public MultipartFile getRv_imgfile() {
		return rv_imgfile;
	}
	public void setRv_imgfile(MultipartFile rv_imgfile) {
		this.rv_imgfile = rv_imgfile;
	}
	public String getRv_img() {
		return rv_img;
	}
	public void setRv_img(String rv_img) {
		this.rv_img = rv_img;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	
}
