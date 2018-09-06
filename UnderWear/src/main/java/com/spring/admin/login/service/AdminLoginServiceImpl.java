package com.spring.admin.login.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.admin.login.dao.AdminLoginDao;
import com.spring.admin.login.vo.AdminLoginVO;


@Service
public class AdminLoginServiceImpl implements AdminLoginService {
	Logger logger = Logger.getLogger(AdminLoginServiceImpl.class);
	@Autowired
	private AdminLoginDao adminLoginDao;
	


	@Override
	public AdminLoginVO userIdSelect(String userId) {
		return adminLoginDao.userIdSelect(userId);
	}

	/* 로그인 처리 메서드 */
	@Override
	public AdminLoginVO loginSelect(String userId, String userPw) {
		AdminLoginVO vo = null;
		// MemberSecurity sec = memberDao.securitySelect(c_id); //암호화 처리띠
		// if (sec != null) {
		// c_pwd = new String(OpenCrypt.getSHA256(c_pwd, sec.getSalt()));
		AdminLoginVO lvo = new AdminLoginVO();
		lvo.setUserId(userId);
		lvo.setUserPw(userPw);
		vo = adminLoginDao.loginSelect(lvo);
		// }
		return vo;
	}

	@Transactional
	@Override
	public int loginHistoryInsert(AdminLoginVO lvo) {
		int result;
		if (userIdSelect(lvo.getUserId()) == null) {
			result = 1;
		} else {
			AdminLoginVO vo = loginHistorySelect(lvo.getUserId());
			if (vo == null) {
				adminLoginDao.loginHistoryInsert(lvo);
			}
			result = 2;
		}
		return result;
	}



	@Transactional
	@Override
	public int loginHistoryUpdate(AdminLoginVO lvo) {
		return adminLoginDao.loginHistoryUpdate(lvo);
	}

	@Override
	public AdminLoginVO loginHistorySelect(String userId) {
		return adminLoginDao.loginHistorySelect(userId);
	}
}
