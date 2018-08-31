package com.spring.client.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.notice.vo.NoticeVO;
@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		return session.selectList("noticeList" , nvo);
	}

	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		return (NoticeVO) session.selectOne("noticeDetail", nvo);
	}

	@Override
	public int noticeHitUpdate(int n_no) {
		return session.update("noticeHitUpdate", n_no);
	}

	@Override
	public int noticeInsert(NoticeVO nvo) {
		return session.selectOne("noticeInsert", nvo);
	}

	@Override
	public int noticeUpdate(NoticeVO nvo) {
		return session.update("noticeUpdate", nvo);
	}

	@Override
	public int noticeDelete(NoticeVO nvo) {
		return session.delete("noticeDelete", nvo);
	}

	

}
