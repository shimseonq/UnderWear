package com.spring.client.member.basket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.member.basket.dao.BasketDao;
import com.spring.client.member.basket.vo.BasketVO;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketDao basketDao;
	
	@Override
	public List<BasketVO> basketList(BasketVO bvo) {
		List<BasketVO> mList = null;
		mList = basketDao.basketList(bvo);
		return mList;
	}

}
