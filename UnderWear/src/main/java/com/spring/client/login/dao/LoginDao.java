package com.spring.client.login.dao;

import com.spring.client.login.vo.LoginVO;
import com.spring.client.member.vo.MemberVO;

public interface LoginDao {

		public LoginVO userIdSelect(String c_id);

		public LoginVO loginSelect(LoginVO lvo);

		public int loginHistoryInsert(LoginVO lvo);

		public int loginHistoryUpdate(LoginVO lvo);

		public MemberVO  idCheck(MemberVO lvo);
		public LoginVO loginHistorySelect(String c_id);
	}
