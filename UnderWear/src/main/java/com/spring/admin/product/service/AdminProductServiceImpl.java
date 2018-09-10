package com.spring.admin.product.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.admin.image.dao.AdminImageDao;
import com.spring.admin.image.vo.AdminImageVO;
import com.spring.admin.product.controller.AdminProductController;
import com.spring.admin.product.dao.AdminProductDao;
import com.spring.admin.product.vo.AdminProductVO;
import com.spring.common.file.FileUploadUtil;

@Service
public class AdminProductServiceImpl implements AdminProductService {
	Logger logger = Logger.getLogger(AdminProductController.class);

	@Autowired
	private AdminProductDao adminProductDao; //의존객체
	
	@Autowired
	private AdminImageDao adminImageDao;
	
	// 글목록 구현
	@Override
	public List<AdminProductVO> productList(AdminProductVO pvo) {
		List<AdminProductVO> myList = null;	
		
		myList = adminProductDao.productList(pvo);
		return myList;		
	}
	
	//글입력 구현
	/*@Override
	public int productInsert(AdminProductVO pvo) {
		int result = 0;
		try {
			result = AdminProductDao.productInsert(pvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}*/

	

	@Override
	public String bigCategory(ObjectMapper mapper) {
		String listData = "";
		List<AdminProductVO> bigcate = adminProductDao.bcategory();
		try {
			listData = mapper.writeValueAsString(bigcate);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return listData;
	}

	@Override
	public String smallCategory(int bigct_no, ObjectMapper mapper) {
		String listData = "";
		List<AdminProductVO> bigcate = adminProductDao.scategory(bigct_no);		/*bigct_no*/
		try {
			listData = mapper.writeValueAsString(bigcate);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return listData;
	}

	@Override
	public List<AdminProductVO> imageList(AdminProductVO cvo) {
		List<AdminProductVO> myList;
		myList = adminProductDao.imageList(cvo);
		return myList;
	}
	
	@Override
	public int imageInsert(AdminProductVO cvo) {
		int result = 0;
		try {
			result = adminProductDao.imageInsert(cvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	/*********************************************************************
	 * 글쓰기 구현(첨부파일)
	 *********************************************************************/
	@Override
	public int productInsert(AdminProductVO pvo, HttpServletRequest request) {
		int result = 0;
		try {
			MultipartFile attachFile = null;
			List<MultipartFile> files = pvo.getFiles();
			String img_image[] = null;
			
			logger.info("files : " + files.size());
			if(files != null && files.size() > 0) {
				logger.info("files : " + files.size());
				img_image = new String[files.size()];
				
				for (int i = 0; i < files.size(); i++ ) {
					attachFile = files.get(i);
					img_image[i] = FileUploadUtil.fileUpload(attachFile, request, "product");
					logger.info(img_image[i]);
				}
			}
			
			pvo.setP_code(adminProductDao.productNumber());
			result = adminProductDao.productInsert(pvo);
			if (img_image != null) {
				for (int i = 0; i < img_image.length; i++) {
					pvo.setImg_image(img_image[i]);
					adminProductDao.imageInsert(pvo);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		
		return result;
	}
	
	// 글 수정 구현
	@Override
	public int productUpdate(AdminProductVO pvo, HttpServletRequest request) {
		int result = 0;
		
		/*try {
			MultipartFile attachFile = null;
			List<MultipartFile> files = pvo.getFiles();
			String img_image[] = null;
			
			logger.info("files : " + files.size());
			if(files != null && files.size() > 0) {
				logger.info("files : " + files.size());
				img_image = new String[files.size()];
				
				for (int i = 0; i < files.size(); i++ ) {
					attachFile = files.get(i);
					img_image[i] = FileUploadUtil.fileUpload(attachFile, request, "product");
					logger.info(img_image[i]);
				}
			}
			
			pvo.setP_code(adminProductDao.productNumber());*/
			result = adminProductDao.productUpdate(pvo);
			/*if (img_image != null) {
				for (int i = 0; i < img_image.length; i++) {
					pvo.setImg_image(img_image[i]);
					adminProductDao.imageUpdate(pvo);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}*/
		
		return result;
	} 

	// 글 상세 구현.
	@Override
	public AdminProductVO productDetail(AdminProductVO pvo) {
		AdminProductVO detail = null;
		detail = adminProductDao.productDetail(pvo);
		return detail;
	}

	@Override
	public int imageUpdate(AdminProductVO ivo) {
		int result = 0;
		result = adminProductDao.imageUpdate(ivo);
		
		return result;
	}

	@Override
	public List<AdminImageVO> productDetailImage(AdminProductVO pvo) {
		List<AdminImageVO> image = null;
		image = adminProductDao.productDetailImage(pvo);
		return image;
	}

	@Override
	public int productDelete(AdminProductVO pvo) {
		int result = 0;
		try {
			result = adminProductDao.statusUpdate(pvo);
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int imageDelete(AdminProductVO pvo) {
		int result = 0;
		try {
			result = adminProductDao.imageDelete(pvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
