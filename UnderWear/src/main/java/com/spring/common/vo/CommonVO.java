package com.spring.common.vo;

import com.spring.client.member.rank.vo.RankVO;



public class CommonVO extends RankVO{



	
	// 조건 검색시 사용할 필드
	private String search = "";
	private String keyword = "";
	private String start_date;
	private String end_date;
	private int bigct_no			= 0;		// 대분류 번호
	private String bigct_category	= "";		// 대분류
	private int pr_no				= 0;		// 가격 번호
	private int pr_01				= 0;		// 가격
	private int smallct_no			= 0;		// 소분류 번호
	private String smallct_category = "";		// 소분류

	
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
	public int getBigct_no() {
		return bigct_no;
	}
	public void setBigct_no(int bigct_no) {
		this.bigct_no = bigct_no;
	}
	public String getBigct_category() {
		return bigct_category;
	}
	public void setBigct_category(String bigct_category) {
		this.bigct_category = bigct_category;
	}
	public int getPr_no() {
		return pr_no;
	}
	public void setPr_no(int pr_no) {
		this.pr_no = pr_no;
	}
	public int getPr_01() {
		return pr_01;
	}
	public void setPr_01(int pr_01) {
		this.pr_01 = pr_01;
	}
	public int getSmallct_no() {
		return smallct_no;
	}
	public void setSmallct_no(int smallct_no) {
		this.smallct_no = smallct_no;
	}
	public String getSmallct_category() {
		return smallct_category;
	}
	public void setSmallct_category(String smallct_category) {
		this.smallct_category = smallct_category;
	}
	
}
