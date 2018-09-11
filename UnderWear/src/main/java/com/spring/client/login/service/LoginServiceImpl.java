package com.spring.client.login.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.client.login.dao.LoginDao;
import com.spring.client.login.vo.LoginVO;
import com.spring.client.member.dao.MemberDao;
import com.spring.client.member.vo.MemberVO;

@Service
public class LoginServiceImpl implements LoginService {
	Logger logger = Logger.getLogger(LoginServiceImpl.class);
	@Autowired
	private LoginDao loginDao;
	

	@Override
	public LoginVO userIdSelect(String c_id) {
		return loginDao.userIdSelect(c_id);
	}

	/* 로그인 처리 메서드 */
	@Override
	public LoginVO loginSelect(String c_id, String c_pwd) {
		LoginVO vo = null;
		// MemberSecurity sec = memberDao.securitySelect(c_id); //암호화 처리띠
		// if (sec != null) {
		// c_pwd = new String(OpenCrypt.getSHA256(c_pwd, sec.getSalt()));
		LoginVO lvo = new LoginVO();
		lvo.setC_id(c_id);
		lvo.setC_pwd(c_pwd);
		vo = loginDao.loginSelect(lvo);
		// }
		return vo;
	}

	@Transactional
	@Override
	public int loginHistoryInsert(LoginVO lvo) {
		int result;
		if (userIdSelect(lvo.getC_id()) == null) {
			result = 1;
		} else {
			LoginVO vo = loginHistorySelect(lvo.getC_id());
			if (vo == null) {
				loginDao.loginHistoryInsert(lvo);
			}
			result = 2;
		}
		return result;
	}

	@Transactional
	@Override
	public int loginHistoryUpdate(LoginVO lvo) {
		return loginDao.loginHistoryUpdate(lvo);
	}

	@Override
	public LoginVO loginHistorySelect(String c_id) {
		return loginDao.loginHistorySelect(c_id);
	}
}
