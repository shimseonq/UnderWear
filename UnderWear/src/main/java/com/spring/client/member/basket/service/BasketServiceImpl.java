package com.spring.client.member.basket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.member.basket.dao.BasketDao;
import com.spring.client.member.basket.vo.BasketVO;
import com.spring.client.product.dao.ProductDao;
import com.spring.client.product.vo.ProductVO;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketDao basketDao;
	@Autowired
	private ProductDao productDao;
	
	@Override
	public List<BasketVO> basketList(BasketVO bvo) {
		List<BasketVO> mList = null;
		mList = basketDao.basketList(bvo);
		return mList;
	}

	@Override
	public ProductVO productDetail(ProductVO pvo) {
		ProductVO detail = null;
	      detail = productDao.productDetail(pvo);
	      return detail;
	
	}

	@Override
	public int basketInsert(BasketVO bvo) {
		int result = 0;
		try {
			result = basketDao.basketInsert(bvo);
		}catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	@Override
	public List<BasketVO> basketOrder(BasketVO bvo) {
		List<BasketVO> mList = null;
		mList = basketDao.basketList(bvo);
		return mList;
	}
	
	

}
