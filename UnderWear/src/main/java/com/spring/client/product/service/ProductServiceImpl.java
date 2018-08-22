package com.spring.client.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int productUpdate(ProductVO pvo) {
		int result = 0;
		try {
			result = productDao.productUpdate(pvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
}
