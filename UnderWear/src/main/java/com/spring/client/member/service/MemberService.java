package com.spring.client.member.service;

import com.spring.client.member.vo.MemberVO;

public interface MemberService {

	int userIdConfirm(String c_id);

	int memberInsert(MemberVO mvo);

}
