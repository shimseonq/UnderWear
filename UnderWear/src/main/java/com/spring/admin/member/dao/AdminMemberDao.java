package com.spring.admin.member.dao;

import java.util.List;

import com.spring.client.member.vo.MemberVO;

public interface AdminMemberDao {

	// 글 목록 구현
	public List<MemberVO> memberList(MemberVO mvo);

	// 글상세 구현
	public MemberVO memberDetail(MemberVO mvo);

}
