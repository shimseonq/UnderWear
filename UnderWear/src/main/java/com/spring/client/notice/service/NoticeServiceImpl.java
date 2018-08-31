package com.spring.client.notice.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.notice.dao.NoticeDao;
import com.spring.client.notice.vo.NoticeVO;
@Service
public class NoticeServiceImpl implements NoticeService {

	Logger logger = Logger.getLogger(NoticeServiceImpl.class);
	
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		List<NoticeVO> nList = null;
		if(nvo.getSearch()=="") {
				
		nvo.setSearch("all");   // 
		}
		nList = noticeDao.noticeList(nvo);
		return nList;
	}

	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		NoticeVO detail = null;
		noticeDao.noticeHitUpdate(nvo.getN_no());
	      detail = noticeDao.noticeDetail(nvo);
	      
	      return detail;
	}

}
