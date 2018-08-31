package com.spring.client.qnaReply.dao;

import java.util.List;

import com.spring.client.qnaReply.vo.QnaReplyVO;

public interface QnaReplyDao {

	public List<QnaReplyVO> qnaReplyList(Integer q_no);

	public int qnaReplyInsert(QnaReplyVO rvo);

	public int pwdCheck(QnaReplyVO qrvo);

}
