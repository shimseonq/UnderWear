package com.spring.client.member.basket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.member.basket.vo.BasketVO;

@Repository
public class BasketDaoImpl implements BasketDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<BasketVO> basketList(BasketVO bvo) {
		return session.selectList("basketList", bvo);
	}

}