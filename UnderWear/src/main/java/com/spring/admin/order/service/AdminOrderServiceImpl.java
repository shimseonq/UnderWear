
package com.spring.admin.order.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.order.controller.AdminOrderController;
import com.spring.client.order.dao.OrderDao;
import com.spring.client.order.vo.OrderVO;

@Service
public class AdminOrderServiceImpl implements AdminOrderService {
	Logger logger = Logger.getLogger(AdminOrderController.class);
	
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
		logger.info("deliveryUpdate 호출"	);
		int o_no;
		int result=0;
		for(int i=0; i<o_num.length; i++) {
			OrderVO vo = new OrderVO();
			o_no = Integer.parseInt(o_num[i]);
			ovo.setO_no(o_no);
			vo = orderDao.adminOrderOne(ovo);
			logger.info("값은"+vo.getO_delivery());
			String delivery = vo.getO_delivery().trim();
			
			if(delivery.equals("결제완료")) {
				logger.info(delivery);
				result = orderDao.deliveryUpdate1(vo);
			}else if(delivery.equals("상품준비중")) {
				result = orderDao.deliveryUpdate2(vo);
			}else if(delivery.equals("배송준비중")) {
				result = orderDao.deliveryUpdate3(vo);
			}else if(delivery.equals("배송중")) {
				result = orderDao.deliveryUpdate4(vo);
			}else
				logger.info(result);
		}
		
		return result;
	}

}