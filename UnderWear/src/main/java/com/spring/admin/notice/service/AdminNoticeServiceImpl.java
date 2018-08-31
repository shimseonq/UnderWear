package com.spring.admin.notice.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.notice.dao.NoticeDao;
import com.spring.client.notice.vo.NoticeVO;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {

	Logger logger = Logger.getLogger(AdminNoticeServiceImpl.class);
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		List<NoticeVO> nList = null;
		
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

	@Override
	public int noticeInsert(NoticeVO nvo) {
		int result = 0;
		try {
			result = noticeDao.noticeInsert(nvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int noticeUpdate(NoticeVO nvo) {
		int result = 0;
		try {
			result = noticeDao.noticeUpdate(nvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int noticeDelete(NoticeVO nvo) {
		int result = 0;
		try {
			result = noticeDao.noticeDelete(nvo);
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
}
