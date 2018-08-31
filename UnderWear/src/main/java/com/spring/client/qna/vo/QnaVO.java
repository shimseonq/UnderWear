package com.spring.client.qna.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.client.login.vo.LoginVO;

public class QnaVO extends LoginVO{

	private int q_no = 0;			//���� �Խ��� ��ȣ
	private String q_title	= "";
	private String q_content = null;	//���� �Խ��� ����
	private String q_date = null;		//���� �Խ��� ����Ʈ
	private MultipartFile  q_imgfile;		//÷������
	private String q_img = "";			//���� ������ ������ ���ϸ�
	private int q_hit	=	0;			//��ȸ��
	 private int repRoot = 0;		//�Խ��� �亯��(�������� ��ȣ ���� - �׷��ȣ)
	 private int repStep = 0;		//�Խ��� �亯��(�亯���� ��ġ��ȣ ����)
	 private int repIndent = 0;		//�Խ��� �亯��(�亯���� ������ȣ ����)
	 private int rCount = 0;		//��� ����
	 private String q_pwd = null;
	
	/*------------------------- common VO -----------------------------*/
	//���� �˻� �� ����� �ʵ�
	private String search = "";
	private String keyword = "";
	private String start_date ="";
	private String end_date = "";
	
	
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_date() {
		return q_date;
	}
	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}
	public MultipartFile getQ_imgfile() {
		return q_imgfile;
	}
	public void setQ_imgfile(MultipartFile q_imgfile) {
		this.q_imgfile = q_imgfile;
	}
	public String getQ_img() {
		return q_img;
	}
	public void setQ_img(String q_img) {
		this.q_img = q_img;
	}
	public int getQ_hit() {
		return q_hit;
	}
	public void setQ_hit(int q_hit) {
		this.q_hit = q_hit;
	}
	public int getRepRoot() {
		return repRoot;
	}
	public void setRepRoot(int repRoot) {
		this.repRoot = repRoot;
	}
	public int getRepStep() {
		return repStep;
	}
	public void setRepStep(int repStep) {
		this.repStep = repStep;
	}
	public int getRepIndent() {
		return repIndent;
	}
	public void setRepIndent(int repIndent) {
		this.repIndent = repIndent;
	}
	public int getrCount() {
		return rCount;
	}
	public void setrCount(int rCount) {
		this.rCount = rCount;
	}
	public String getQ_pwd() {
		return q_pwd;
	}
	public void setQ_pwd(String q_pwd) {
		this.q_pwd = q_pwd;
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
