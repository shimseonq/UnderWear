package com.spring.client.product.service;

import java.util.List;

import com.spring.client.product.vo.ProductVO;


public interface ProductService {
	public List<ProductVO> productList(ProductVO pvo);
	
	public int productInsert(ProductVO pvo);

	public int productUpdate(ProductVO pvo);
}
