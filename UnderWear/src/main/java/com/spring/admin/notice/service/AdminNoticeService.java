package com.spring.admin.notice.service;

import java.util.List;

import com.spring.client.notice.vo.NoticeVO;

public interface AdminNoticeService {

	public List<NoticeVO> noticeList(NoticeVO nvo);

	public NoticeVO noticeDetail(NoticeVO nvo);
	
	public int noticeInsert(NoticeVO nvo);

	public int noticeUpdate(NoticeVO nvo);

	public int noticeDelete(NoticeVO nvo);
}
