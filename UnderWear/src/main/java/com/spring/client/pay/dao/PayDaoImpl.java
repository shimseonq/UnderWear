package com.spring.client.pay.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.pay.vo.PayVO;
import com.spring.client.sale.vo.SaleVO;

@Repository
public class PayDaoImpl implements PayDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public int payInsert(SaleVO svo) {
		return session.insert("payInsert");
	}

	@Override
	public int payNumber() {
		return session.selectOne("payNumber");
	}

	@Override
	public List<PayVO> payList(PayVO pvo) {
		return session.selectList("payList", pvo);
	}

}
