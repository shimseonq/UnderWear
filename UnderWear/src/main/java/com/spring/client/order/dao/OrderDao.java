package com.spring.client.order.dao;

import java.util.List;

import com.spring.client.order.vo.OrderVO;
import com.spring.client.sale.vo.SaleVO;

public interface OrderDao {

	public int orderInsert(SaleVO svo);

	public List<OrderVO> orderList(OrderVO ovo);
	
	public int orderNumber();
	
	public List<OrderVO> adminOrderList(OrderVO ovo);
	
	public int orderFinish(OrderVO ovo);
	
	public int deliveryUpdate1(OrderVO ovo);
	
	public int deliveryUpdate2(OrderVO ovo);
	
	public int deliveryUpdate3(OrderVO ovo);
	
	public int deliveryUpdate4(OrderVO ovo);
}


