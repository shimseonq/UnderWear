package com.spring.client.login.service;

import com.spring.client.login.vo.LoginVO;

public interface LoginService {
	public LoginVO userIdSelect(String c_id);

	public LoginVO loginSelect(String c_id, String c_pwd);

	public int loginHistoryInsert(LoginVO lvo);

	public int loginHistoryUpdate(LoginVO lvo);

	public LoginVO loginHistorySelect(String c_id);
}
