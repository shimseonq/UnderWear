package com.spring.client.member.service;

import com.spring.client.member.vo.MemberVO;

public interface MemberService {

	int userIdConfirm(String userId);

	int memberInsert(MemberVO mvo);



}