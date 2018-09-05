package com.spring.client.product.service;

import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.client.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> productList(ProductVO pvo);

	public ProductVO productDetail(ProductVO pvo);
	
	public int productUpdate(ProductVO pvo);
	
	public int productDelete(ProductVO pvo);

	public int productInsert(ProductVO pvo);
	
	public String bigCategory(ObjectMapper mapper);
	   
	public String smallCategory(int bigct_no, ObjectMapper mapper);

	public List<ProductVO> productThumbnail(ProductVO pvo);

	
	 
}
