package com.spring.client.sale.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.sale.vo.SaleVO;

@Repository
public class SaleDaoImpl implements SaleDao {

	@Autowired
	private SqlSession session;

	@Override
	public int saleInsert(SaleVO svo) {
		return session.insert("saleInsert");
	}
}
