package com.spring.client.member.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.member.dao.MemberDao;
import com.spring.client.member.vo.MemberSecurity;
import com.spring.client.member.vo.MemberVO;
import com.spring.common.util.Util;

@Service
public class MemberServiceImpl implements MemberService {
	Logger logger = Logger.getLogger(MemberServiceImpl.class);

	@Autowired
	private MemberDao memberDao;

	@Override
	public int userIdConfirm(String userId) { // ��밡���� ���̵����� Ȯ��ó���ϴ� ��
		int result;
		if (memberDao.memberSelect(userId) != null) {
			result = 1;
		} else {
			result = 2;
		}
		return result;
	}

	@Override
	public int memberInsert(MemberVO mvo) {
		int sCode = 1;
		if (memberDao.memberSelect(mvo.getUserId()) != null) {
			return 1;
		} else {
			try {
				MemberSecurity sec = new MemberSecurity();
				sec.setUserId(mvo.getUserId());
				sec.setSalt(Util.getRandomString());
				/* sCode = memberDao.securityInsert(sec); */

				if (sCode == 1) {
					/* mvo.setUserPw(new String(OpenCrypt.getSHA256(mvo.getUserPw()))); */
					memberDao.memberInsert(mvo);
					return 3;
				} else {
					return 2;
				}
			} catch (RuntimeException e) {
				e.printStackTrace();
				return 2;
			}
		}

	}
}