package com.spring.client.member.service;

import com.spring.client.member.rank.vo.RankVO;
import com.spring.client.member.vo.MemberVO;

public interface MemberService {

	public int userIdConfirm(String c_id);
	
	public String myRank(MemberVO mvo);

	public int memberInsert(MemberVO mvo);
}
