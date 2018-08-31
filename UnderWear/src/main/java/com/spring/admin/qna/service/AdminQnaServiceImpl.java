package com.spring.admin.qna.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.qna.dao.QnaDao;
import com.spring.client.qna.vo.QnaVO;

@Service
public class AdminQnaServiceImpl implements AdminQnaService {

	Logger logger = Logger.getLogger(AdminQnaServiceImpl.class);
	
	@Autowired
	private QnaDao qnaDao;

	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		List<QnaVO> qList = null;
		
		qList = qnaDao.qnaList(qvo);
		return qList;
	}

	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		QnaVO detail = null;
		qnaDao.qnaHitUpdate(qvo.getQ_no());
	      detail = qnaDao.qnaDetail(qvo);
	      
	      return detail;
	}

	@Override
	public int qnaUpdate(QnaVO qvo) {
		int result = 0;
		try {
			result = qnaDao.qnaUpdate(qvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	

	}
