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

	@Override
	public int basketInsert(BasketVO bvo) {
		return session.insert("basketInsert",bvo);
	}

	@Override
	public int basketDelete(BasketVO bvo) {
		return session.delete("basketDelete",bvo);
	}

	@Override
	public BasketVO basketOrder(BasketVO bvo) {
		return session.selectOne("basketOrder", bvo);
	}
	
}
