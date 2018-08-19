package com.spring.client.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.member.vo.MemberSecurity;
import com.spring.client.member.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession session;

	@Override
	public MemberVO memberSelect(String userId) {
		return (MemberVO) session.selectOne("memberSelect", userId);
	}

	@Override
	public int memberInsert(MemberVO mvo) {
		return session.insert("memberInsert");
	}

	@Override
	public int securityInsert(MemberSecurity userId) {
		return session.insert("securityInsert", userId);
	}

	@Override
	public MemberSecurity securitySelect(String userId) {
		return (MemberSecurity) session.selectOne("securitySelect", userId);
	}
}
