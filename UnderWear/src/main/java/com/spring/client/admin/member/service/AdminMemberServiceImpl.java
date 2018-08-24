package com.spring.client.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.admin.member.dao.AdminMemberDao;
import com.spring.client.member.vo.MemberVO;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	//��ǰ ����Ʈ �����ֱ�
	@Autowired
	private AdminMemberDao adminMemberDao;
	@Override
	public List<MemberVO> memberList(MemberVO mvo) {
		List<MemberVO> mList=null;
		mList = adminMemberDao.memberList(mvo);
		return mList;
	}
	//��ǰ �󼼺���
	@Override
	public MemberVO memberDetail(MemberVO mvo) {
		MemberVO detail = new MemberVO();
		detail = adminMemberDao.memberDetail(mvo);
		return detail;
	}

}