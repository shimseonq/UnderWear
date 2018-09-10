package com.spring.client.member.rank.dao;

import java.util.List;

import com.spring.client.member.rank.vo.RankVO;


public interface RankDao {



	public List<RankVO> rankList(RankVO rvo);

	public String myRank(RankVO rvo);

	public double discount(String c_id);
	
	
}
