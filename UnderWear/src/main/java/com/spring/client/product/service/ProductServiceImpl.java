package com.spring.client.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.admin.image.vo.AdminImageVO;
import com.spring.client.product.dao.ProductDao;
import com.spring.client.product.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao; //의존객체

	// 글목록 구현
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		List<ProductVO> myList = null;
		
		myList = productDao.productList(pvo);
		return myList;		
	}
	//디테일공간
	@Override
	public ProductVO productDetail(ProductVO pvo) {
		ProductVO detail = null;
	      detail = productDao.productDetail(pvo);
	      return detail;
	}
	@Override
	public ProductVO productMain(ProductVO pvo) {
		ProductVO main = null;
		main = productDao.productMain(pvo);
		return main;
	}
	
	@Override
	public int productDelete(ProductVO pvo) {
		int result = 0;
		try {
			result = productDao.productDelete(pvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	@Override
	public int productUpdate(ProductVO pvo) {
		int result = 0;
		try {
			result = productDao.productUpdate(pvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	   //글입력 구현
	   @Override
	   public int productInsert(ProductVO pvo) {
	      int result = 0;
	      try {
	         result = productDao.productInsert(pvo);
	      } catch (Exception e) {
	         e.printStackTrace();
	         result = 0;
	      }
	      return result;
	   }
	
	
	   @Override
	   public String bigCategory(ObjectMapper mapper) {
	      String listData = "";
	      List<ProductVO> bigcate = productDao.bcategory();
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
	      List<ProductVO> bigcate = productDao.scategory();
	      try {
	         listData = mapper.writeValueAsString(bigcate);
	      } catch (JsonProcessingException e) {
	         e.printStackTrace();
	      }
	      return listData;
	   }

	@Override
	public List<ProductVO> productThumbnail(ProductVO pvo) {
		List<ProductVO> myList = null;
		myList = productDao.productThumbnail(pvo);
		return myList;
	}
	

	@Override
	public List<AdminImageVO> productDetailImage(ProductVO pvo) {
		List<AdminImageVO> image = null;
		image = productDao.productDetailImage(pvo);
		return image;
		
	}
	

	
	
	
}
