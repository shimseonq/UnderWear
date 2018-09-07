package com.spring.client.member.basket.dao;

import java.util.List;

import com.spring.client.member.basket.vo.BasketVO;

public interface BasketDao {

	public List<BasketVO> basketList(BasketVO bvo);

	public int basketInsert(BasketVO bvo);


	public int basketDelete(BasketVO bvo);

	public BasketVO basketOrder(BasketVO bvo);

}
