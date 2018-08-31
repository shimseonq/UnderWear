package com.spring.admin.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.admin.notice.service.AdminNoticeService;
import com.spring.client.notice.vo.NoticeVO;

@Controller
@RequestMapping(value="/admin")
public class AdminNoticeController {
Logger logger  = Logger.getLogger(AdminNoticeController.class);
	
	@Autowired
	private AdminNoticeService adminNoticeService;
	
	/***********************************************************************
	 * �۸�� �����ϱ�
	 ************************************************************************/
	
	@RequestMapping(value="/notice/noticeList.do",method=RequestMethod.GET)
	public String noticeList(@ModelAttribute("data")NoticeVO nvo, Model model) {
		logger.info("admin noticeList ȣ�� ����");
		
		//��ü ���ڵ� ����
		List<NoticeVO> noticeList = adminNoticeService.noticeList(nvo);
		
		model.addAttribute("noticeList",noticeList);
		
		return "admin/notice/noticeList";
	}
	
	/********************
	 * �� �󼼺��� ����
	 ********************/
	@RequestMapping(value="/notice/noticeDetail.do", method=RequestMethod.GET)
	public String noticeDetail(NoticeVO nvo, Integer curPage,Model model) {
		logger.info("noticeDetail ȣ�� ����");
		logger.info("n_no = " + nvo.getN_no());
		
		NoticeVO detail = new NoticeVO();
		detail = adminNoticeService.noticeDetail(nvo);
		
		if(detail != null && (!detail.equals(""))) {
			detail.setN_content(detail.getN_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		return "admin/notice/noticeDetail";
	}
	
	/*********************
	 * ���ۼ� ��
	 *********************/
	@RequestMapping(value="/notice/writeForm.do")
	public String writeForm() {
		logger.info("writeForm ȣ�⼺��");
		
		return "admin/notice/writeForm";
	}
	
	/*****************************************************************************************
	 * ���Է�
	 *****************************************************************************************/
	@RequestMapping(value="/notice/noticeInsert.do", method=RequestMethod.POST)
	public String noticeInsert(NoticeVO nvo, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("noticeInsert ȣ�⼺��");
		
		int result = 0;
		String url = "";
		
		result = adminNoticeService.noticeInsert(nvo);
		
		if (result == 1) {
			url = "/admin/notice/noticeList.do";	
		} else {
			model.addAttribute("code", 1);	
			url = "/admin/notice/writeForm.do";
		}
		
		return "redirect:"+url;		
	}
	
	/***********************************************************************
	 * �� �����ϱ�
	 * @throws IOException
	 ***********************************************************************/
	@RequestMapping(value="/notice/noticeUpdate.do", method=RequestMethod.POST)
	public String noticeUpdate(NoticeVO nvo, Model model, HttpServletRequest request) throws IOException {
		logger.info("noticeUpdate ȣ�� ����");
		
		int result = 0;
		String url = "";
		
		result = adminNoticeService.noticeUpdate(nvo);
		
		if (result == 1) {
			url = "/admin/notice/noticeDetail.do?n_no="+nvo.getN_no();
		} else {
			url = "/admin/notice/updateForm.do?n_no="+nvo.getN_no();
		}
		
		return "redirect:"+url;
	}
	

	/*******************************************
	 * @return : �����ϴ� ��
	 *******************************************/
	@RequestMapping(value="/notice/updateForm.do")
	public String updateForm(NoticeVO nvo, Model model) {
		logger.info("updateForm ȣ�� ����");
		
		logger.info("n_no = " + nvo.getN_no());
		
		NoticeVO updateData = new NoticeVO();
		updateData = adminNoticeService.noticeDetail(nvo);
		
		model.addAttribute("updateData", updateData);
		return "/admin/notice/updateForm";
	}
	
	/*******************************************
	 * @return : �� ����
	 *******************************************/
	@RequestMapping(value="/notice/noticeDelete.do")
	public String noticeDelete(NoticeVO nvo, HttpServletRequest request) throws IOException {
		logger.info("noticeDelete ȣ�� ����");
		
		// �Ʒ� �������� �Է� ������ ���� ���°��� ����ϴ�. (1 or 0)
		int result = 0;
		String url = "";
		
		result = adminNoticeService.noticeDelete(nvo);		// int�� �Ӽ����� ��ȯ�ϰ��� �� �� (nvo.getN_no())
		
		if (result == 1) {
			url = "/admin/notice/noticeList.do";
		} else {
			url = "/admin/notice/noticeDetail.do?n_no="+nvo.getN_no();
		}
		
		return "redirect:"+url;
	}
}
