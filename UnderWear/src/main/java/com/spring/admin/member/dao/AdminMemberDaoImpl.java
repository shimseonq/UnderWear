package com.spring.admin.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.member.vo.MemberVO;


@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<MemberVO> memberList(MemberVO mvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int rankPayUpdate1(MemberVO mvo) {
		
		return session.update("rankPayUpdate1", mvo);
	}

	@Override
	public int rankPayUpdate2(MemberVO mvo) {
		return session.update("rankPayUpdate2", mvo);
	}

	@Override
	public int rankPayUpdate3(MemberVO mvo) {
		return session.update("rankPayUpdate3", mvo);
	}

	@Override
	public List<MemberVO> memberRank(MemberVO mvo) {
		return session.selectList("memberRank", mvo);
	}

	@Override
	public MemberVO rankNo(MemberVO mvo) {
		return session.selectOne("rankNo");
	}
	
	
	
}
