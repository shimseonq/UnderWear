package com.spring.admin.image.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.common.vo.CommonVO;

public class AdminImageVO extends CommonVO {
	private int img_no				= 0;		// 이미지 번호

	// 파일 업로드를 위한 필드
	private List<MultipartFile> files;		// 첨부 파일
	private String img_image = "";			// 실제 서버에 저장한 파일명
	private String img_main = "";
	
	public int getImg_no() {
		return img_no;
	}
	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public String getImg_image() {
		return img_image;
	}
	public void setImg_image(String img_image) {
		this.img_image = img_image;
	}
	public String getImg_main() {
		return img_main;
	}
	public void setImg_main(String img_main) {
		this.img_main = img_main;
	}
	
	
	
}
