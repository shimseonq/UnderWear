package com.spring.admin.member.rank.dao;

import java.util.List;

import com.spring.client.member.rank.vo.RankVO;
import com.spring.client.member.vo.MemberVO;

public interface AdminRankDao {

	public List<RankVO> rankList(RankVO rvo);

	public String myRank(RankVO rvo);

}
