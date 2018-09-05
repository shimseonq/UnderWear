package com.spring.admin.image.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.image.dao.ImageDao;
import com.spring.admin.image.vo.ImageVO;

@Service
public class ImageServiceImpl implements ImageService {
	@Autowired
	private ImageDao imageDao;

	@Override
	public List<ImageVO> imageList(ImageVO ivo) {
		List<ImageVO> myList;
		myList = imageDao.imageList(ivo);
		return myList;
	}

	@Override
	public int imageInsert(ImageVO ivo) {
		int result = 0;
		try {
			result = imageDao.imageInsert(ivo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int getImageSeq() {
		int result = 0;
		result = imageDao.getImageSeq();
		return result;
	}

	@Override
	public String getMain(int img_no) {
		String result = "";
		result = imageDao.getMain(img_no);
		return result;
	}

	@Override
	public int imageMainUpdate(ImageVO ivo) {
		int result = 0;
		result = imageDao.imageMainUpdate(ivo);
		return result;
	}

	@Override
	public ImageVO imageDetail(ImageVO ivo) {
		ImageVO detail = null;
		detail = imageDao.imageDetail(ivo);
		return detail;
	}

	@Override
	public int imageUpdate(ImageVO ivo) {
		int result = 0;
		result = imageDao.imageUpdate(ivo);
		return result;
	}

	@Override
	public int imageDelete(ImageVO ivo) {
		int result = 0;
		result = imageDao.imageDelete(ivo);
		return result;
	}

	@Override
	public List<ImageVO> imageName() {
		List<ImageVO> myList = null;
		myList = imageDao.imageName();
		return myList;
	}
	
}
