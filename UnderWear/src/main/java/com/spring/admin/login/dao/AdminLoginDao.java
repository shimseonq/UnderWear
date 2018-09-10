package com.spring.admin.login.dao;

import com.spring.admin.login.vo.AdminLoginVO;

public interface AdminLoginDao {

		public AdminLoginVO userIdSelect(String userId);

		public AdminLoginVO loginSelect(AdminLoginVO lvo);

		public int loginHistoryInsert(AdminLoginVO lvo);

		public int loginHistoryUpdate(AdminLoginVO lvo);

		public AdminLoginVO loginHistorySelect(String userId);
	}
