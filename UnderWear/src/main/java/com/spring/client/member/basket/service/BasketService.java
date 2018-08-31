package com.spring.client.member.basket.service;

import java.util.List;

import com.spring.client.member.basket.vo.BasketVO;
import com.spring.client.product.vo.ProductVO;

public interface BasketService {

	public List<BasketVO> basketList(BasketVO bvo);
	
	public ProductVO productDetail(ProductVO pvo);

	public int basketInsert(BasketVO bvo);
	
	public List<BasketVO> basketOrder(BasketVO bvo);
	
}
