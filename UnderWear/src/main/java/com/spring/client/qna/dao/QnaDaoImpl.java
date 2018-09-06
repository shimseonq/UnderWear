package com.spring.client.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.qna.vo.QnaVO;

@Repository
public class QnaDaoImpl implements QnaDao {
	//의존성 주입
	@Autowired
	private SqlSession session;

	
	//리스트 구현
	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		return session.selectList("qnaList", qvo);
	}
	//글 입력 구현
	@Override
	public int qnaInsert(QnaVO qvo) {
		return session.selectOne("qnaInsert", qvo);
	}
	//글 상세보기 구현
	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		return (QnaVO)session.selectOne("qnaDetail", qvo);
	}
	//글 수정하기 구현
	@Override
	public int qnaUpdate(QnaVO qvo) {
		return session.update("qnaUpdate", qvo);
	}
	@Override
	public int pwdConfirm(QnaVO qvo) {
		return (Integer)session.selectOne("pwdConfirm", qvo);
	}
	@Override
	public int qnaDelete(QnaVO qvo) {
		return session.delete("qnaDelete", qvo);
	}
	@Override
	public int qnaHitUpdate(int q_no) {
		return session.update("qnaHitUpdate", q_no);
	}
	
	@Override
	public int replyInsert(QnaVO qvo) {
		return session.selectOne("qnaInsert", qvo);
	}
	@Override
	public int makeReply(QnaVO qvo) {
		return (Integer)session.selectOne("makeReply", qvo);
	}
	
	@Override
	public QnaVO replyDetail(QnaVO qvo) {
		return (QnaVO)session.selectOne("replyDetail", qvo);
	}
	
	
}
