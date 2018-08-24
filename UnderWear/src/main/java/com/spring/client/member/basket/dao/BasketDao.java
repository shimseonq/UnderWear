package com.spring.client.member.basket.dao;

import java.util.List;

import com.spring.client.member.basket.vo.BasketVO;

public interface BasketDao {

	public List<BasketVO> basketList(BasketVO bvo);

}
