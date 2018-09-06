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
	
}
