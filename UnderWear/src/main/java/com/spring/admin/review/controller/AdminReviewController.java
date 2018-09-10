package com.spring.admin.review.controller;

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

import com.spring.client.review.service.ReviewService;
import com.spring.client.review.vo.ReviewVO;
import com.spring.common.file.FileUploadUtil;

@Controller
@RequestMapping(value="/admin")
public class AdminReviewController {	
	Logger logger = Logger.getLogger(AdminReviewController.class);
	
	@Autowired	//������ ����
	private ReviewService reviewService;
	
	/*********************
	 * ����Ʈ����
	 *********************/
	@RequestMapping(value="/review/reviewList.do", method = RequestMethod.GET)
	public String reviewList(@ModelAttribute ("data")ReviewVO rvo, Model model) {
		logger.info("reviewList ȣ�� ����");
		
		List<ReviewVO> reviewList = reviewService.reviewList(rvo);
		model.addAttribute("reviewList", reviewList);
		
		return "/admin/review/reviewList";
	}
	
	/********************
	 * �ۻ󼼺���
	 ********************/
	@RequestMapping(value="/review/reviewDetail.do", method=RequestMethod.GET)
	public String reviewDetail(ReviewVO rvo, Model model) {
		logger.info("reviewDetail ȣ�⼺��");
		logger.info("rv_no = " + rvo.getRv_no());
		
		ReviewVO detail = new ReviewVO();
		detail = reviewService.reviewDetail(rvo);
		
		if(detail != null && (!detail.equals(""))) {
			detail.setRv_content(detail.getRv_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		return "/admin/review/reviewDetail";
	}
	
	
	/*****************************************************************************************
	 * �ۻ���
	 *****************************************************************************************/
	@RequestMapping(value="/review/reviewDelete.do")
	public String reviewDelete(ReviewVO rvo, HttpServletRequest request) throws IOException {
		logger.info("reviewDelete ȣ�� ����");
		
		// �Ʒ� �������� �Է� ������ ���� ���°��� ����ϴ�. (1 or 0)
		int result = 0;
		String url = "";
		
		// ������ �����ϸ�
		if (!rvo.getRv_img().isEmpty()) {
			FileUploadUtil.fileDelete(rvo.getRv_img(), request);
		}
		
		result = reviewService.reviewDelete(rvo);		// int�� �Ӽ����� ��ȯ�ϰ��� �� �� (rvo.getrv_no())
		
		logger.info("�� �����ϴ� �� �Ǵ��� ��ȣ �R�� !!!!!" + rvo.getRv_no());
		if (result == 1) {
			url = "/admin//review/reviewList.do";
		} else {
			url = "/admin/review/reviewDetail.do?rv_no="+rvo.getRv_no();
		}
		
		return "redirect:"+url;
	}
}
