package com.spring.client.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.member.rank.vo.RankVO;
import com.spring.client.member.vo.MemberSecurity;
import com.spring.client.member.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession session;

	@Override
	public MemberVO memberSelect(String c_id) {
		return (MemberVO) session.selectOne("memberSelect", c_id);
	}

	@Override
	public int memberInsert(MemberVO mvo) {
		return session.insert("memberInsert");
	}

	@Override
	public int securityInsert(MemberSecurity c_id) {
		return session.insert("securityInsert", c_id);
	}

	@Override
	public MemberSecurity securitySelect(String c_id) {
		return (MemberSecurity) session.selectOne("securitySelect", c_id);
	}
	
	@Override
	public String myRank(MemberVO rvo) {
		return session.selectOne("myRank");
	}
}
