package com.spring.client.pay.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.order.dao.OrderDao;
import com.spring.client.pay.dao.PayDao;
import com.spring.client.pay.vo.PayVO;
import com.spring.client.product.vo.ProductVO;
import com.spring.client.sale.vo.SaleVO;

@Service
public class PayServiceImpl implements PayService {

	@Autowired
	private PayDao payDao;

	@Override
	public List<PayVO> payList(PayVO pvo) {
		List<PayVO> myList = null;
		
		myList = payDao.payList(pvo);
		return myList;			
	}
	
}
