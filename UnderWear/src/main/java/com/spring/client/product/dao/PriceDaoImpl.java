package com.spring.client.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.product.vo.PriceVO;

@Repository
public class PriceDaoImpl implements PriceDao{
	
	@Autowired
	private SqlSession session;
	
	public List<PriceVO> priceList(PriceVO prvo){
		return session.selectList("priceList", prvo);
	}
	
}
