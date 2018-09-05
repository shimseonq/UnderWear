package com.spring.admin.order.service;

import java.util.List;

import com.spring.client.order.vo.OrderVO;

public interface AdminOrderService {

	public List<OrderVO> adminOrderList(OrderVO ovo);

	public int deliveryUpdate(OrderVO ovo, String[] o_num);
}
