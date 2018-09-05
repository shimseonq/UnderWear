package com.spring.client.member.basket.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.member.basket.dao.BasketDao;
import com.spring.client.member.basket.vo.BasketVO;
import com.spring.client.member.rank.dao.RankDao;


@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketDao basketDao;
	
	@Autowired
	private RankDao rankDao;
	
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
	public int basketDelete(BasketVO bvo, String[] b_num) {	//체크된거 여러개 선택
		int b_no;
		int result=0;
		for(int i=0; i<b_num.length; i++) {
			b_no = Integer.parseInt(b_num[i]);
			bvo.setB_no(b_no);
			result = basketDao.basketDelete(bvo);
		}
		return result;
	}

	@Override
	public List<BasketVO> basketOrder(BasketVO bvo, String[] b_num) {
		List<BasketVO> mList = new ArrayList<BasketVO>();	//체크된거 여러개 선택
		BasketVO vo = new BasketVO();
		int b_no;
		int total = 0;
		for(int i=0; i<b_num.length; i++) {
			b_no = Integer.parseInt(b_num[i]);
			bvo.setB_no(b_no);
			vo = basketDao.basketOrder(bvo);
			total += vo.getTotal();
			mList.add(vo);
		}
		bvo.setPaytotal(total);
		double sale = total * rankDao.discount(bvo.getC_id());
		System.out.println(rankDao.discount(bvo.getC_id()));
		bvo.setPaysale(sale);
		return mList;
	}	
 
}
