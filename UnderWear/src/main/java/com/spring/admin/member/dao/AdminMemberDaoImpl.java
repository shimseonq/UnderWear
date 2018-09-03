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
		
		return session.selectList("memberList",mvo);
	}

}
