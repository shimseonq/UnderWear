package com.spring.admin.image.service;

import java.util.List;

import com.spring.admin.image.vo.ImageVO;

public interface ImageService {
	public List<ImageVO> imageList(ImageVO ivo);
	public int imageInsert(ImageVO ivo);
	public int getImageSeq();
	public String getMain(int img_no);
	public int imageMainUpdate(ImageVO ivo);
	public ImageVO imageDetail(ImageVO ivo);
	public int imageUpdate(ImageVO ivo);
	public int imageDelete(ImageVO ivo);
	public List<ImageVO> imageName();

}
