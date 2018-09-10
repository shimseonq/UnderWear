package com.spring.admin.product.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.admin.image.vo.AdminImageVO;
import com.spring.admin.product.vo.AdminProductVO;


public interface AdminProductService {
	// LIST
	public List<AdminProductVO> productList(AdminProductVO pvo);
	public List<AdminProductVO> imageList(AdminProductVO pvo);

	// CATEGORY
	public String bigCategory(ObjectMapper mapper);
	
	public String smallCategory(int bigct_no, ObjectMapper mapper);
	
	// UPDATE
	public int productUpdate(AdminProductVO pvo, HttpServletRequest request);
	public int imageUpdate(AdminProductVO ivo);
	
	// INSERT
	public int imageInsert(AdminProductVO pvo);
	public int productInsert(AdminProductVO pvo, HttpServletRequest request);
	
	// DETAIL
	public AdminProductVO productDetail(AdminProductVO pvo);
	public List<AdminImageVO> productDetailImage(AdminProductVO pvo);

	// DELETE
	public int productDelete(AdminProductVO pvo);
	public int imageDelete(AdminProductVO pvo);

	

	
	
	
	
	

 
}
