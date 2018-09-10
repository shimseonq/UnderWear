package com.spring.admin.image.service;

import java.util.List;

import com.spring.admin.image.vo.AdminImageVO;

public interface AdminImageService {
	public List<AdminImageVO> imageList(AdminImageVO ivo);
	public int imageInsert(AdminImageVO ivo);
	/*public int getImageSeq();
	public String getMain(int img_no);*/
	public AdminImageVO imageDetail(AdminImageVO ivo);
	public int imageUpdate(AdminImageVO ivo);
	public int imageDelete(AdminImageVO ivo);
	public List<AdminImageVO> imageName();

}