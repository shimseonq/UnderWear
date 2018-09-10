package com.spring.admin.member.dao;

import java.util.List;

import com.spring.client.member.vo.MemberVO;

public interface AdminMemberDao {

	// 글 목록 구현
	public List<MemberVO> memberList(MemberVO mvo);
	
	public int rankPayUpdate1(MemberVO mvo); 
	public int rankPayUpdate2(MemberVO mvo); 
	public int rankPayUpdate3(MemberVO mvo); 
	
	public List<MemberVO> memberRank(MemberVO mvo);
	
	public MemberVO rankNo(MemberVO mvo);

}
