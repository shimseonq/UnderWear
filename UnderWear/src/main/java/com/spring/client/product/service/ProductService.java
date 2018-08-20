package com.spring.client.product.service;

import java.util.List;

import com.spring.client.product.vo.BigCategoryVO;
import com.spring.client.product.vo.PriceVO;
import com.spring.client.product.vo.ProductVO;
import com.spring.client.product.vo.SmallCategoryVO;

public interface ProductService {
	public List<ProductVO> productList(ProductVO pvo);

	public List<PriceVO> priceList(PriceVO prvo);

	public List<BigCategoryVO> bigCategoryList(BigCategoryVO bvo);

	public List<SmallCategoryVO> smallCateList(SmallCategoryVO svo);
	
	public int productInsert(ProductVO pvo);
}
