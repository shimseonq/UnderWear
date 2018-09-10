package com.spring.client.sale.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.pay.dao.PayDao;
import com.spring.client.sale.dao.SaleDao;
import com.spring.client.sale.vo.SaleVO;

@Service
public class SaleServiceImpl implements SaleService{

	@Autowired
	private SaleDao saleDao;
	
	@Autowired
	private PayDao payDao;

	@Override
	public int saleInsert(SaleVO svo) {
		int result = 0;
		try {
        	svo.setO_no(payDao.payNumber());
			result = saleDao.saleInsert(svo);
		}catch(Exception e){
			e.printStackTrace();
			result=0;
		}
		return result;
	}
}
