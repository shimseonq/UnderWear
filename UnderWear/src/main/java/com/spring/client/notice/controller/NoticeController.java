package com.spring.client.notice.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.notice.service.NoticeService;
import com.spring.client.notice.vo.NoticeVO;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {
	
	Logger logger = Logger.getLogger(NoticeController.class);
		
	@Autowired
	private NoticeService noticeService;
	
	/*********************
	 * �۸�� �����ϱ�
	 *********************/
	@RequestMapping(value="/noticeList.do", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute ("data")NoticeVO nvo, Model model) {
		logger.info("noticeList ȣ�� ����");
		
		List<NoticeVO> noticeList = noticeService.noticeList(nvo);
		model.addAttribute("noticeList", noticeList);
		
		return "notice/noticeList";
	}
	
	/********************
	 * �� �󼼺��� ����
	 ********************/
	@RequestMapping(value="noticeDetail.do", method=RequestMethod.GET)
	public String noticeDetail(NoticeVO nvo, Integer curPage,Model model) {
		logger.info("noticeDetail ȣ�� ����");
		logger.info("n_no = " + nvo.getN_no());
		
		NoticeVO detail = new NoticeVO();
		detail = noticeService.noticeDetail(nvo);
		
		if(detail != null && (!detail.equals(""))) {
			detail.setN_content(detail.getN_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		return "notice/noticeDetail";
	}
	/********************
	 * ����¡ ó��
	 ********************/


}
