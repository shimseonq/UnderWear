package com.spring.admin.qna.controller;

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

import com.spring.admin.qna.service.AdminQnaService;
import com.spring.client.qna.vo.QnaVO;
import com.spring.common.file.FileUploadUtil;

@Controller
@RequestMapping(value="/admin")
public class AdminQnaController {
Logger logger  = Logger.getLogger(AdminQnaController.class);
	
	@Autowired
	private AdminQnaService adminQnaService;
	
	/***********************************************************************
	 * 글목록 구현하기
	 ************************************************************************/
	
	@RequestMapping(value="/qna/qnaList.do",method=RequestMethod.GET)
	public String qnaList(@ModelAttribute("data")QnaVO qvo, Model model) {
		logger.info("adminqnaList 호출 성공");
		//전체 레코드 구현
		List<QnaVO> qnaList = adminQnaService.qnaList(qvo);
		
		model.addAttribute("qnaList",qnaList);
		
		return "/admin/qna/qnaList";
	}
	
	/********************
	 * 글 상세보기 구현
	 ********************/
	@RequestMapping(value="/qna/qnaDetail.do", method=RequestMethod.GET)
	public String qnaDetail(QnaVO qvo, Integer curPage,Model model) {
		logger.info("qnaDetail 호출 성공");
		logger.info("q_no = " + qvo.getQ_no());
		
		QnaVO detail = new QnaVO();
		detail = adminQnaService.qnaDetail(qvo);
		
		if(detail != null && (!detail.equals(""))) {
			detail.setQ_content(detail.getQ_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		return "/admin/qna/qnaDetail";
	}
	
	/********************
	 * 답변달기!!
	 ********************/
	@RequestMapping(value="/qna/replyForm.do")
	public String replyFrom(QnaVO qvo, Model model) {
		logger.info("replyFrom 호출 성공");
		
		logger.info("q_no = " + qvo.getQ_no());
		
		QnaVO updateData = new QnaVO();
		updateData = adminQnaService.qnaDetail(qvo);
		
		model.addAttribute("updateData", updateData);
		return "/admin/qna/replyForm";
	}
	
	/***********************************************************************
	 *글 수정
	 * @throws IOException
	 ***********************************************************************/
	@RequestMapping(value="/qna/qnaUpdate.do", method=RequestMethod.POST)
	public String qnaUpdate(QnaVO qvo, Model model, HttpServletRequest request) throws IOException {
		logger.info("qnaUpdate 호출성공");
		
		int result = 0;
		String url = "";
		String q_img = "";
		
		if(!qvo.getQ_imgfile().isEmpty()) {
			logger.info("================= file = " + qvo.getQ_imgfile().getOriginalFilename());
			
			if(!qvo.getQ_img().isEmpty()) {
				FileUploadUtil.fileDelete(qvo.getQ_img(), request);
			}
			
			q_img = FileUploadUtil.fileUpload(qvo.getQ_imgfile(), request, "qna");
			qvo.setQ_img(q_img);
		} else {
			logger.info("글 수정 호출");
			qvo.setQ_img("");
		}
		
		result = adminQnaService.qnaUpdate(qvo);
		
		if (result == 1) {
			url = "/admin/qna/qnaDetail.do?q_no="+qvo.getQ_no();
		} else {
			url = "/admin/qna/replyForm.do?q_no="+qvo.getQ_no();
		}
		
		return "redirect:"+url;
	}
	
}
