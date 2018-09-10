package com.spring.admin.member.rank.service;

import java.util.List;

import com.spring.client.member.rank.vo.RankVO;
import com.spring.client.member.vo.MemberVO;
import com.spring.client.order.vo.OrderVO;

public interface AdminRankService {

	public List<RankVO> rankList(RankVO rvo);

	public String myRank(RankVO rvo);
	
	public int rankPaysUpdate(MemberVO mvo, String[] c_num);
	
}
