package com.spring.admin.member.rank.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.member.rank.vo.RankVO;

@Repository
public class AdminRankDaoImpl implements AdminRankDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<RankVO> rankList(RankVO rvo) {
		return session.selectList("rankList", rvo);
	}

	@Override
	public String myRank(RankVO rvo) {
		return session.selectOne("myRank", rvo);
	}

}
