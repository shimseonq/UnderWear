package com.spring.admin.member.rank.service;

import java.util.List;

import com.spring.client.member.rank.vo.RankVO;
import com.spring.client.member.vo.MemberVO;

public interface AdminRankService {

	public List<RankVO> rankList(RankVO rvo);

	public String myRank(RankVO rvo);
	


}
