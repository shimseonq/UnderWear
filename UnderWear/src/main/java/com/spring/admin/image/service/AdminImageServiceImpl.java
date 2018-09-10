package com.spring.admin.image.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.image.dao.AdminImageDao;
import com.spring.admin.image.vo.AdminImageVO;

@Service
public class AdminImageServiceImpl implements AdminImageService {
	@Autowired
	private AdminImageDao adminImageDao;

	@Override
	public List<AdminImageVO> imageList(AdminImageVO ivo) {
		List<AdminImageVO> myList;
		myList = adminImageDao.imageList(ivo);
		return myList;
	}

	@Override
	public int imageInsert(AdminImageVO ivo) {
		int result = 0;
		try {
			result = adminImageDao.imageInsert(ivo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	/*@Override
	public int getImageSeq() {
		int result = 0;
		result = adminImageDao.getImageSeq();
		return result;
	}*/

	/*@Override
	public String getMain(int img_no) {
		String result = "";
		result = adminImageDao.getMain(img_no);
		return result;
	}*/

	@Override
	public AdminImageVO imageDetail(AdminImageVO ivo) {
		AdminImageVO detail = null;
		detail = adminImageDao.imageDetail(ivo);
		return detail;
	}

	@Override
	public int imageUpdate(AdminImageVO ivo) {
		int result = 0;
		result = adminImageDao.imageUpdate(ivo);
		return result;
	}

	@Override
	public int imageDelete(AdminImageVO ivo) {
		int result = 0;
		result = adminImageDao.imageDelete(ivo);
		return result;
	}

	@Override
	public List<AdminImageVO> imageName() {
		List<AdminImageVO> myList = null;
		myList = adminImageDao.imageName();
		return myList;
	}
	
}
