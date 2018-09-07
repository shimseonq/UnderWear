package com.spring.admin.image.dao;

import java.util.List;

import com.spring.admin.image.vo.AdminImageVO;
import com.spring.admin.product.vo.AdminProductVO;
import com.spring.client.product.vo.ProductVO;

public interface AdminImageDao {
	public List<AdminImageVO> imageList(AdminImageVO ivo);
	public int imageInsert(AdminImageVO ivo);
	/*public int getImageSeq();
	public String getMain(int img_no);*/
	public int imageMainUpdate(AdminImageVO ivo);
	public AdminImageVO imageDetail(AdminImageVO ivo);
	public int imageUpdate(AdminImageVO ivo);
	public int imageDelete(AdminImageVO ivo);
	public List<AdminImageVO> imageName();
	public List<AdminImageVO> imageList(ProductVO ivo);
	
}