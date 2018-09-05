package com.spring.client.sale.dao;

import java.util.List;

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

	@Override
	public List<SaleVO> adminSaleList(SaleVO svo) {
		return session.selectList("adminSaleList", svo);
	}
}
