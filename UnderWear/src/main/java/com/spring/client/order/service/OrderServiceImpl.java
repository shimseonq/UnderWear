package com.spring.client.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.order.dao.OrderDao;
import com.spring.client.order.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;
	
	@Override
	public int orderInsert(OrderVO ovo) {
		int result=0;
		try {
			result= orderDao.orderInsert(ovo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
