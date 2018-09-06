package com.spring.admin.login.service;

import com.spring.admin.login.vo.AdminLoginVO;


public interface AdminLoginService {
	public AdminLoginVO userIdSelect(String userId);

	public AdminLoginVO loginSelect(String userId, String userPw);

	public int loginHistoryInsert(AdminLoginVO lvo);

	public int loginHistoryUpdate(AdminLoginVO lvo);

	public AdminLoginVO loginHistorySelect(String userId);
}
