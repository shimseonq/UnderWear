package com.spring.client.order.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.order.vo.OrderVO;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public int orderInsert(OrderVO ovo) {
		return session.insert("orderInsert",ovo);
	}

}
