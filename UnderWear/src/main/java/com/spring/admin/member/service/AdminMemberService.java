package com.spring.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.client.member.vo.MemberVO;

public interface AdminMemberService {
	//글목록
	@Autowired
	public List<MemberVO> memberList(MemberVO mvo);


	//글상세 구현
	public MemberVO memberDetail(MemberVO mvo);

}
