package com.spring.admin.qna.service;

import java.util.List;

import com.spring.client.qna.vo.QnaVO;

public interface AdminQnaService {

	public List<QnaVO> qnaList(QnaVO qvo);

	public QnaVO qnaDetail(QnaVO qvo);
	
	public int qnaUpdate(QnaVO qvo);
}
