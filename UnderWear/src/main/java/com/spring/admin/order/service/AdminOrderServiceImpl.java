package com.spring.admin.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.order.dao.OrderDao;
import com.spring.client.order.vo.OrderVO;

@Service
public class AdminOrderServiceImpl implements AdminOrderService {

	@Autowired
	private OrderDao orderDao;
	
	@Override
	public List<OrderVO> adminOrderList(OrderVO ovo) {
		List<OrderVO> oList = null;
		oList = orderDao.adminOrderList(ovo);
		return oList;
	}


	@Override
	public int deliveryUpdate(OrderVO ovo, String[] o_num) {
		int o_no;
		int result=0;
		for(int i=0; i<o_num.length; i++) {
			o_no = Integer.parseInt(o_num[i]);
			ovo.setO_no(o_no);
			if(ovo.getO_delivery() =="결제 완료") 
				result = orderDao.deliveryUpdate1(ovo);
			else if(ovo.getO_delivery()=="상품준비중")
				result = orderDao.deliveryUpdate2(ovo);
			else if(ovo.getO_delivery()=="배송준비중")
				result = orderDao.deliveryUpdate3(ovo);
			else if(ovo.getO_delivery()=="배송중")
				result = orderDao.deliveryUpdate4(ovo);
		}
		return result;
	}


}
