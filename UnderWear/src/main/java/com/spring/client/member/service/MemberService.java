package com.spring.client.member.service;

import java.util.List;

import com.spring.client.member.vo.MemberVO;
import com.spring.client.qna.vo.QnaVO;

public interface MemberService {

	public int userIdConfirm(String c_id);

	public int memberInsert(MemberVO mvo);
	

	public MemberVO myInfo(MemberVO mvo);

	public int memberUpdate(MemberVO mvo);

	public MemberVO memberSelect(String c_id);

	public int memberDelete(MemberVO mvo);

	
	public List<MemberVO> memberList(MemberVO mvo);
	
	public List<QnaVO> customerBoardList (MemberVO mvo);
}
