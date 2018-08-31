package com.spring.client.qnaReply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.qnaReply.vo.QnaReplyVO;

@Repository
public class QnaReplyDaoImpl implements QnaReplyDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<QnaReplyVO> qnaReplyList(Integer q_no) {
		return session.selectList("qnaReplyList", q_no);
	}
	//글입력 구현 
	@Override
	public int qnaReplyInsert(QnaReplyVO rvo) {
		return session.insert("qnaReplyInsert",rvo);
		}
	@Override
	public int pwdCheck(QnaReplyVO qrvo) {
		return (Integer)session.selectOne("pwdCheck", qrvo);

	}
}
