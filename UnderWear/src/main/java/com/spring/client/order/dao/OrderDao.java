package com.spring.client.order.dao;

import java.util.List;

import com.spring.client.order.vo.OrderVO;
import com.spring.client.sale.vo.SaleVO;

public interface OrderDao {

	public int orderInsert(SaleVO svo);

	public List<OrderVO> orderList(OrderVO ovo);
	
	public int orderNumber();
}


