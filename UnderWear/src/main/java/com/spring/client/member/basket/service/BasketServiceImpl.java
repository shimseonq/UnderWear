package com.spring.client.member.basket.service;

import java.util.ArrayList;
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
	public int basketInsert(BasketVO bvo) {
		int result=0;
		try {
			result= basketDao.basketInsert(bvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	@Override
	public int basketDelete(BasketVO bvo) {
		int result=0;
		try {
			result= basketDao.basketDelete(bvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public List<BasketVO> basketOrder(BasketVO bvo, String[] b_num) {
		List<BasketVO> mList = new ArrayList<BasketVO>();	//개 좃같은 코드
		BasketVO vo = new BasketVO();
		int b_no;
		for(int i=0; i<b_num.length; i++) {
			b_no = Integer.parseInt(b_num[i]);
			bvo.setB_no(b_no);
			vo = basketDao.basketOrder(bvo);
			mList.add(vo);
		}
		return mList;
	}	

}
