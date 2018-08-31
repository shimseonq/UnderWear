package com.spring.client.qna.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.qna.dao.QnaDao;
import com.spring.client.qna.vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService {
	Logger logger = Logger.getLogger(QnaServiceImpl.class);
	
	
	/*********************
	 * 글목록 구현
	 *********************/
	@Autowired
	private QnaDao qnaDao;

	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		List<QnaVO> qList = null;
		if(qvo.getSearch()=="") {
				
		qvo.setSearch("all");   // 검색 대상인 all에 대한 정의
		}
		qList = qnaDao.qnaList(qvo);
		return qList;
	}
	
	/*********************
	 * 글 입력 하는 폼
	 *********************/
		@Override
		public int qnaInsert(QnaVO qvo) {
			int result = 0;
			try {
				result = qnaDao.qnaInsert(qvo);
			} catch (Exception e) {
				e.printStackTrace();
				result = 0;
			}
			return result;
		}

		/*********************
		 * 글  상세보기 구현 하는 부분
		 *********************/
	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		QnaVO detail = null;
		qnaDao.qnaHitUpdate(qvo.getQ_no());
		detail = qnaDao.qnaDetail(qvo);
		return detail;
	}

	/*********************
	 * 글  수정 하는 부분
	 *********************/
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

		/*********************
		 * 비밀번호 확인 구현
		 *********************/
		@Override
		public int pwdConfirm(QnaVO qvo) {
			int result = 0;
			result = qnaDao.pwdConfirm(qvo);
			return result;
		}

		/*********************
		 * 게시글 삭제
		 *********************/
		@Override
		public int qnaDelete(QnaVO qvo) {
			int result = 0;
			try {
				result = qnaDao.qnaDelete(qvo);
			} catch(Exception e) {
				e.printStackTrace();
				result = 0;
			}
			return result;
		}
		
}
