package com.spring.client.admin.member.dao;

import java.util.List;

import com.spring.client.member.vo.MemberVO;

public interface AdminMemberDao {

	public List<MemberVO> memberList(MemberVO mvo);

}
