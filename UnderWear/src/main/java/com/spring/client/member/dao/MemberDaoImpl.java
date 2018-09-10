package com.spring.client.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.member.vo.MemberSecurity;
import com.spring.client.member.vo.MemberVO;
import com.spring.client.qna.vo.QnaVO;

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
	public MemberVO myInfo(MemberVO mvo) {
		return session.selectOne("myInfo", mvo);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		return session.update("memberUpdate", mvo);
	}

	@Override
	public int memberDelete(MemberVO mvo) {
		return session.delete("memberDelete",mvo);
	}

	@Override
	public int securityDelete(String c_id) {
		return session.delete("securityDelete",c_id);
	}

	@Override
	public List<MemberVO> memberList(MemberVO mvo) {
		return session.selectOne("memberLst",mvo);  //八祸 包府磊 窜
	}

	@Override
	public int termsInsert(MemberVO mvo) {  //距包 包府
		
		return session.insert("termsInsert", mvo);
	}

	@Override
	public List<QnaVO> customerBoardList(MemberVO mvo) {
		return session.selectList("customerBoardList",mvo);
	}

}
