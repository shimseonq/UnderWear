package com.spring.client.member.dao;

import java.util.List;

import com.spring.client.member.vo.MemberSecurity;
import com.spring.client.member.vo.MemberVO;
import com.spring.client.qna.vo.QnaVO;

public interface MemberDao {

   public MemberVO memberSelect(String c_id);

   public int securityInsert(MemberSecurity set);

   public int memberInsert(MemberVO mvo);

   public MemberSecurity securitySelect(String c_id);

	public List<MemberVO> memberList(MemberVO mvo);
	
	public int termsInsert(MemberVO mvo);

   public MemberVO myInfo(MemberVO mvo);


	public int memberDelete(MemberVO mvo);	
	
	public int securityDelete(String c_id);
	
	public int memberUpdate(MemberVO mvo);

	public List<QnaVO> customerBoardList(MemberVO mvo);
}