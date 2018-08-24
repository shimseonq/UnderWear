package com.spring.client.member.dao;

import com.spring.client.member.vo.MemberSecurity;
import com.spring.client.member.vo.MemberVO;

public interface MemberDao {

	public MemberVO memberSelect(String c_id);

	public int securityInsert(MemberSecurity set);

	public int memberInsert(MemberVO mvo);

	public MemberSecurity securitySelect(String c_id);

}
