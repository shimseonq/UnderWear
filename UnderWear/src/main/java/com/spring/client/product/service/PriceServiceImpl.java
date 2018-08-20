package com.spring.client.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.client.product.dao.PriceDao;
import com.spring.client.product.vo.PriceVO;

public class PriceServiceImpl implements PriceService {

	
		@Autowired
		private PriceDao priceDao; 
		
		@Override
		public List<PriceVO> priceList(PriceVO prvo) {
			List<PriceVO> myList = null;
			
			myList = priceDao.priceList(prvo);
			return myList;
	}

}
