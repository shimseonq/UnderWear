package com.spring.client.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.order.vo.OrderVO;
import com.spring.client.sale.vo.SaleVO;

@Repository
public class OrderDaoImpl implements OrderDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int orderInsert(SaleVO svo) {
		return session.insert("orderInsert");
	}

	@Override
	public List<OrderVO> orderList(OrderVO ovo) {
		return session.selectList("orderList", ovo);
	}

	@Override
	public int orderNumber() {
		return session.selectOne("orderNumber");
	}

	@Override
	public List<OrderVO> adminOrderList(OrderVO ovo) {
		return session.selectList("adminOrderList", ovo);
	}

	@Override
	public int orderFinish(OrderVO ovo) {
		return session.update("orderFinish");
	}

	@Override
	public int deliveryUpdate1(OrderVO ovo) {
		return session.update("deliveryUpdate1",ovo);
	}

	@Override
	public int deliveryUpdate2(OrderVO ovo) {
		return session.update("deliveryUpdate2",ovo);
	}

	@Override
	public int deliveryUpdate3(OrderVO ovo) {
		return session.update("deliveryUpdate3",ovo);
	}

	@Override
	public int deliveryUpdate4(OrderVO ovo) {
		return session.update("deliveryUpdate4",ovo);
	}

	@Override
	public OrderVO adminOrderOne(OrderVO ovo) {
		return session.selectOne("adminOrderOne");
	}
	
}
