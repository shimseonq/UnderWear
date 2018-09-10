package com.spring.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.member.dao.AdminMemberDao;
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
	
	@Override
	public List<MemberVO> memberRank(MemberVO mvo) {
		List<MemberVO> mList=null;
		mList = adminMemberDao.memberRank(mvo);
		return mList;
	}

}
