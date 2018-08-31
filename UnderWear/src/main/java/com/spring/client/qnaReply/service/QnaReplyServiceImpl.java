package com.spring.client.qnaReply.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.qnaReply.dao.QnaReplyDao;
import com.spring.client.qnaReply.vo.QnaReplyVO;
@Service
public class QnaReplyServiceImpl implements QnaReplyService {

	Logger logger = Logger.getLogger(QnaReplyServiceImpl.class);
	
	@Autowired
	private QnaReplyDao qnaReplyDao;
	
	@Override
	public List<QnaReplyVO> qnaReplyList(Integer q_no) {
		List<QnaReplyVO> myList = null;
		myList = qnaReplyDao.qnaReplyList(q_no);
		
		return myList;
	}

	@Override
	public int qnaReplyInsert(QnaReplyVO rvo) {
		int result = 0;
		try {
			result = qnaReplyDao.qnaReplyInsert(rvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int pwdCheck(QnaReplyVO qrvo) {
		int result=0;
		result = qnaReplyDao.pwdCheck(qrvo);
		return result;
	}

}
