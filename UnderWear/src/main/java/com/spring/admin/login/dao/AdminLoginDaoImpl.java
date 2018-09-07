package com.spring.admin.login.dao;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.admin.login.vo.AdminLoginVO;

@Repository
public class AdminLoginDaoImpl implements AdminLoginDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public AdminLoginVO userIdSelect(String userId) {
		return (AdminLoginVO) session.selectOne("userIdSelect", userId);
	}
	@Override
	public AdminLoginVO loginSelect(AdminLoginVO lvo) {
		return (AdminLoginVO) session.selectOne("loginSelect", lvo);
	}
	@Override
	public int loginHistoryInsert(AdminLoginVO lvo) {
		return session.insert("loginHistoryInsert", lvo);
	}
	@Override
	public int loginHistoryUpdate(AdminLoginVO lvo) {
		return session.update("loginHistoryUpdate", lvo);
	}
	@Override
	public AdminLoginVO loginHistorySelect(String userId) {
		return (AdminLoginVO) session.selectOne("loginHistorySelect", userId);
	}
}
