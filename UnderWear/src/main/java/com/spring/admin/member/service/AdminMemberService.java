package com.spring.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.client.member.vo.MemberVO;

public interface AdminMemberService {
	//±Û¸ñ·Ï
	@Autowired
	public List<MemberVO> memberList(MemberVO mvo);

}
