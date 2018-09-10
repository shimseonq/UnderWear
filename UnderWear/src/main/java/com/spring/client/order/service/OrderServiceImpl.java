package com.spring.client.order.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.member.basket.dao.BasketDao;
import com.spring.client.order.dao.OrderDao;
import com.spring.client.order.vo.OrderVO;
import com.spring.client.pay.dao.PayDao;
import com.spring.client.product.dao.ProductDao;
import com.spring.client.product.vo.ProductVO;
import com.spring.client.sale.dao.SaleDao;
import com.spring.client.sale.vo.SaleVO;

@Service
public class OrderServiceImpl implements OrderService {
	Logger logger = Logger.getLogger(OrderServiceImpl.class);
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private PayDao payDao;
	
	@Autowired
	private SaleDao saleDao;
	
	@Autowired
	private BasketDao basketDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Override
	public int orderInsert(SaleVO svo, String[] b_num, String[] p_num) {
		logger.info("orderInsert ¼º°ø");
		int result=0;
		try {
			for(int i=0; i<b_num.length; i++) {	
				svo.setB_no(Integer.parseInt(b_num[i]));
				svo.setP_code(Integer.parseInt(p_num[i]));
				logger.info(svo.getP_code());
				result= orderDao.orderInsert(svo); 
				svo.setB_status(basketDao.statusUpdate(svo));
				svo.setO_no(orderDao.orderNumber());
				productDao.inventoryCount(svo);
				result = payDao.payInsert(svo);
			}
			svo.setPa_no(payDao.payNumber());
			result = saleDao.saleInsert(svo);
		}catch(Exception e) {
			e.printStackTrace(); 
		}
		return result;
	}

	@Override
	public List<OrderVO> orderList(OrderVO ovo) {
		List<OrderVO> mList = null;
		mList = orderDao.orderList(ovo);
		return mList;
	}

	@Override
	public int orderFinish(OrderVO ovo) {
		int result=0;
		try {
			result = orderDao.orderFinish(ovo);
		}catch(Exception e) {
			e.printStackTrace();
			result=0;
		}
		return result;
	}
	
}
