package com.spring.client.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.login.vo.LoginVO;
import com.spring.client.review.service.ReviewService;
import com.spring.client.review.vo.ReviewVO;
import com.spring.common.file.FileUploadUtil;

@Controller
@RequestMapping(value="/review")
public class ReviewController {	
	Logger logger = Logger.getLogger(ReviewController.class);
	
	@Autowired	//������ ����
	private ReviewService reviewService;
	
	/*********************
	 * ����Ʈ����
	 *********************/
	@RequestMapping(value="/reviewList.do", method = RequestMethod.GET)
	public String reviewList(@ModelAttribute ("data")ReviewVO rvo, Model model) {
		logger.info("reviewList ȣ�� ����");
		
		List<ReviewVO> reviewList = reviewService.reviewList(rvo);
		model.addAttribute("reviewList", reviewList);
		
		return "review/reviewList";
	}
	
	/********************
	 * �ۻ󼼺���
	 ********************/
	@RequestMapping(value="reviewDetail.do", method=RequestMethod.GET)
	public String reviewDetail(ReviewVO rvo, Model model) {
		logger.info("reviewDetail ȣ�⼺��");
		logger.info("rv_no = " + rvo.getRv_no());
		
		ReviewVO detail = new ReviewVO();
		detail = reviewService.reviewDetail(rvo);
		
		if(detail != null && (!detail.equals(""))) {
			detail.setRv_content(detail.getRv_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		return "review/reviewDetail";
	}
	
	/*******************************************
	 * �� ���� ��
	 *******************************************/
	@RequestMapping(value="/updateForm.do")
	public String updateForm(ReviewVO rvo, Model model) {
		logger.info("updateForm ȣ�� ����");
		
		logger.info("rv_no = " + rvo.getRv_no());
		
		ReviewVO updateData = new ReviewVO();
		updateData = reviewService.reviewDetail(rvo);
		
		model.addAttribute("updateData", updateData);
		return "review/updateForm";
	}
	
	/*********************
	 * ���ۼ� ��
	 *********************/
	@RequestMapping(value="/writeForm.do")
	public String writeForm() {
		logger.info("writeForm ȣ�⼺��");
		return "review/writeForm";
	}
	
	
	/***********************************************************************
	 * �� �����ϱ�
	 * @throws IOException
	 ***********************************************************************/
	@RequestMapping(value="/reviewUpdate.do", method=RequestMethod.POST)
	public String reviewUpdate(ReviewVO rvo, Model model, HttpServletRequest request) throws IOException {
		logger.info("reviewUpdate ȣ�� ����");
		
		int result = 0;
		String url = "";
		String rv_img = "";
		
		if(!rvo.getRv_imgfile().isEmpty()) {
			logger.info("================= file = " + rvo.getRv_imgfile().getOriginalFilename());
			
			// ���� ���� ���� ó��
			if(!rvo.getRv_img().isEmpty()) {
				FileUploadUtil.fileDelete(rvo.getRv_img(), request);
			}
			
			// �ٽ� ���� ���ε� ����
			rv_img = FileUploadUtil.fileUpload(rvo.getRv_imgfile(), request, "review");
			rvo.setRv_img(rv_img);
		} else {
			logger.info("÷������ ����");
			rvo.setRv_img("");
		}
		
		/*logger.info("============== rv_img = " + rvo.getRv_img());*/
		result = reviewService.reviewUpdate(rvo);
		
		if (result == 1) {
			// url = "/review/reviewList.do";		// ���� �� ������� �̵�
			// �Ʒ� url�� ���� �� �� �������� �̵�
			url = "/review/reviewDetail.do?rv_no="+rvo.getRv_no();
		} else {
			url = "/review/updateForm.do?rv_no="+rvo.getRv_no();
		}
		
		return "redirect:"+url;
	}
	
	/*****************************************************************************************
	 * ��� ��ȣ Ȯ��
	 *****************************************************************************************/
	@ResponseBody
	@RequestMapping(value="pwdConfirm.do", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")	// ����,������ ���� ��� �� ���ڵ��ؾ���.
	public String pwdConfirm(ReviewVO rvo) {
		logger.info("pwdConfirm ȣ�� ����");
		String value = "";
		
		// �Ʒ� �������� �Է� ������ ���� ���°� ����(1 or 0)
		int result = reviewService.pwdConfirm(rvo);
		// return result+"";		// ������ ��ȯ
		
		if (result == 1) {
			value = "����";
		} else {
			value = "����";
		}
		logger.info("result = " + result + " value = " + value);
		
		return value;	// ���ڿ�(�ѱ�) ��ȯ.
	}
	
	/*****************************************************************************************
	 * ���Է�
	 *****************************************************************************************/
	@RequestMapping(value="/reviewInsert.do", method=RequestMethod.POST)
	public String reviewInsert(ReviewVO rvo, Model model, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		logger.info("reviewInsert ȣ�⼺��");
		
		logger.info("fileName : " + rvo.getRv_imgfile().getOriginalFilename());
		logger.info("rv_title : " + rvo.getRv_title());
		
		LoginVO login =(LoginVO)session.getAttribute("login");
		if(login==null) {
			return "redirect:/login/login.do";
		}
		// �α����� ���������� Ȯ�� �ϴ� �κ�
	    logger.info("c_id = "+login.getC_id());
	    logger.info("c_num = "+login.getC_num());
	    
	    // ����ȣ�� �� �����ͼ� rvo�� ��� �κ�
	    rvo.setC_num(login.getC_num());
	    
		int result = 0;
		String url = "";
		
		
		if(!rvo.getRv_imgfile().isEmpty()) {
			String q_img = FileUploadUtil.fileUpload(rvo.getRv_imgfile(), request, "review");		
			rvo.setRv_img(q_img);
		} else {
			rvo.setRv_img("");
		}
		/*rvo.setC_id(login.getC_id());*/
		
		rvo.setC_num(login.getC_num());
		result = reviewService.reviewInsert(rvo);
		
		
		if (result == 1) {
			url = "/review/reviewList.do";	
		} else {
			model.addAttribute("code", 1);	
			url = "/review/writeForm.do";
		}
		
		return "redirect:"+url;		
	}
	
	/*****************************************************************************************
	 * ���Է�
	 *****************************************************************************************/
	@RequestMapping(value="/reviewDelete.do")
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
		
		if (result == 1) {
			url = "/review/reviewList.do";
		} else {
			url = "/review/reviewDetail.do?rv_no="+rvo.getRv_no();
		}
		
		return "redirect:"+url;
	}
}
