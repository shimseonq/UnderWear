package com.spring.client.order.service;

import java.util.List;

import com.spring.client.order.vo.OrderVO;
import com.spring.client.pay.vo.PayVO;
import com.spring.client.sale.vo.SaleVO;

public interface OrderService {

	public int orderInsert(SaleVO svo);

	public List<OrderVO> orderList(OrderVO ovo);

}
