package com.spring.admin.image.dao;

import java.util.List;

import com.spring.admin.image.vo.ImageVO;

public interface ImageDao {
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
