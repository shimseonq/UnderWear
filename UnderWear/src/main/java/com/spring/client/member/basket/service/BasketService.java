package com.spring.client.member.basket.service;

import java.util.List;

import com.spring.client.member.basket.vo.BasketVO;

public interface BasketService {

	public List<BasketVO> basketList(BasketVO bvo );

	public int basketInsert(BasketVO bvo);

	public int basketDelete(BasketVO bvo,  String[] b_num);

	public List<BasketVO> basketOrder(BasketVO bvo, String[] b_num);
}
