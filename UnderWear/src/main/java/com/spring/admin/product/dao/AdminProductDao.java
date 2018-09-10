package com.spring.admin.product.dao;

import java.util.List;

import com.spring.admin.image.vo.AdminImageVO;
import com.spring.admin.product.vo.AdminProductVO;

public interface AdminProductDao {
	// List
	public List<AdminProductVO> productList(AdminProductVO pvo);
	public List<AdminProductVO> imageList(AdminProductVO cvo);
	
	// insert
	public int productInsert(AdminProductVO pvo);
	public int imageInsert(AdminImageVO ivo);
	public int productNumber();
	
	// category
	public List<AdminProductVO> bcategory();
	public List<AdminProductVO> scategory(int bigct_no);		/*int bigct_no*/

	// Product Detail
	public AdminProductVO productDetail(AdminProductVO pvo);
	public List<AdminImageVO> productDetailImage(AdminProductVO pvo);
	
	//Product Update
	public int productUpdate(AdminProductVO pvo);
	public int imageUpdate(AdminProductVO ivo);
	
	// Product Delete
	public int productDelete(AdminProductVO pvo);
	public int imageDelete(AdminProductVO pvo);
	
	public int statusUpdate(AdminProductVO pvo);

	
	

}
