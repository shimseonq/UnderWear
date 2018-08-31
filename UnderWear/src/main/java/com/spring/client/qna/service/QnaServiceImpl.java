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
	 * �۸�� ����
	 *********************/
	@Autowired
	private QnaDao qnaDao;

	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		List<QnaVO> qList = null;
		if(qvo.getSearch()=="") {
				
		qvo.setSearch("all");   // �˻� ����� all�� ���� ����
		}
		qList = qnaDao.qnaList(qvo);
		return qList;
	}
	
	/*********************
	 * �� �Է� �ϴ� ��
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
		 * ��  �󼼺��� ���� �ϴ� �κ�
		 *********************/
	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		QnaVO detail = null;
		qnaDao.qnaHitUpdate(qvo.getQ_no());
		detail = qnaDao.qnaDetail(qvo);
		return detail;
	}

	/*********************
	 * ��  ���� �ϴ� �κ�
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
		 * ��й�ȣ Ȯ�� ����
		 *********************/
		@Override
		public int pwdConfirm(QnaVO qvo) {
			int result = 0;
			result = qnaDao.pwdConfirm(qvo);
			return result;
		}

		/*********************
		 * �Խñ� ����
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
