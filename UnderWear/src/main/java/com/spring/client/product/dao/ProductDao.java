package com.spring.client.product.dao;

import java.util.List;

import com.spring.client.product.vo.ProductVO;

public interface ProductDao {
	public List<ProductVO> productList(ProductVO pvo);
	
	public int productInsert(ProductVO pvo);

	public int productUpdate(ProductVO pvo);
	public ProductVO productDetail(ProductVO pvo);
}