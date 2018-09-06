package com.spring.client.qna.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.spring.client.login.service.LoginService;
import com.spring.client.login.vo.LoginVO;
import com.spring.client.qna.service.QnaService;
import com.spring.client.qna.vo.QnaVO;
import com.spring.common.file.FileUploadUtil;
@Controller
@RequestMapping(value="/qna")
public class QnaController {
	Logger logger = Logger.getLogger(QnaController.class);
	
	@Autowired
	private QnaService qnaService;
	@Autowired
	private LoginService loginService;
	
	/*********************
	 * 리스트보기
	 *********************/
	@RequestMapping(value="/qnaList.do", method = RequestMethod.GET)
	public String qnaList(@ModelAttribute ("data")QnaVO qvo, Model model ) {
		logger.info("qnaList 호출성공");
		/*LoginVO login =(LoginVO)session.getAttribute("login");
	      logger.info("c_id = "+login.getC_id());
	      qvo.setC_id(login.getC_id());*/
		
		List<QnaVO> qnaList = qnaService.qnaList(qvo);
		model.addAttribute("qnaList", qnaList);
	
		return "qna/qnaList";
	}
	
	/*********************
	 * 글작성 폼
	 *********************/
	@RequestMapping(value="/writeForm.do")
	public String writeForm(HttpSession session , QnaVO qvo) {
		logger.info("writeForm 호출성공");
		
	/*	LoginVO login =(LoginVO)session.getAttribute("login");
		if(login==null) {
			return "redirect:/login/login.do";
			
		}*/
		
		
		//로그인이 안되 있을 경우 로그인 ㄴ창으로 던져버
		LoginVO login =(LoginVO)session.getAttribute("login");
	      
	       if(login == null) {
	            return "login/login";           
	       }else {   
	          logger.info("c_id ="+login.getC_id());
	          qvo.setC_id(login.getC_id());
		
		
	}
	       return "qna/writeForm";
	}
	
	/********************
	 * 글상세보기
	 * @throws Exception 
	 ********************/
	@RequestMapping(value="qnaDetail.do", method=RequestMethod.GET)
	public String qnaDetail(QnaVO qvo, Model model, HttpSession session) throws Exception {
	
		logger.info("qnaDetail 호출성공");
		logger.info("q_no = " + qvo.getQ_no());
		
		QnaVO detail = new QnaVO();
		
		LoginVO login =(LoginVO)session.getAttribute("login");
		qvo.setC_id(login.getC_id());
		
		detail = qnaService.qnaDetail(qvo);
		if(detail != null && (!detail.equals(""))) {
			detail.setQ_content(detail.getQ_content().toString().replaceAll("\n", "<br>"));
		}
		
		
		model.addAttribute("detail", detail);
		return "qna/qnaDetail";
	}
	
	/*******************************************
	 * 글수정폼
	 *******************************************/
	@RequestMapping(value="/updateForm.do")
	public String updateForm(QnaVO qvo, Model model) {
		logger.info("updateForm 호출성공");
		
		logger.info("q_no = " + qvo.getQ_no());
		
		QnaVO updateData = new QnaVO();
		updateData = qnaService.qnaDetail(qvo);
		
		model.addAttribute("updateData", updateData);
		return "qna/updateForm";
	}
	
	/*****************************************************************************************
	 * 글입력
	 *****************************************************************************************/
	@RequestMapping(value="/qnaInsert.do", method=RequestMethod.POST)
	public String qnaInsert(QnaVO qvo, Model model, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		logger.info("qnaInsert 호출성공");
		
		logger.info("fileName : " + qvo.getQ_imgfile().getOriginalFilename());
		logger.info("q_title : " + qvo.getQ_title());
		
		LoginVO login =(LoginVO)session.getAttribute("login");
	
		/*if(login==null) {
			return "redirect:/login/login.do";
		}*/
		qvo.setC_num(login.getC_num());
		
	    logger.info("c_id = "+login.getC_id());
	    logger.info("c_num = "+login.getC_num());
	    
		int result = 0;
		String url = "";
		
		
		if(!qvo.getQ_imgfile().isEmpty()) {
			String q_img = FileUploadUtil.fileUpload(qvo.getQ_imgfile(), request, "qna");		
			qvo.setQ_img(q_img);
		} else {
			qvo.setQ_img("");
		}
		/*qvo.setC_id(login.getC_id());*/
		
		qvo.setC_num(login.getC_num());
		result = qnaService.qnaInsert(qvo);
		
		
		if (result == 1) {
			url = "/qna/qnaList.do";	
		} else {
			model.addAttribute("code", 1);	
			url = "/qna/writeForm.do";
		}
		
		return "redirect:"+url;		
	}
	
	/***********************************************************************
	 *글 수정
	 * @throws IOException
	 ***********************************************************************/
	@RequestMapping(value="/qnaUpdate.do", method=RequestMethod.POST)
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
		
		result = qnaService.qnaUpdate(qvo);
		
		if (result == 1) {
			url = "/qna/qnaDetail.do?q_no="+qvo.getQ_no();
		} else {
			url = "/qna/updateForm.do?q_no="+qvo.getQ_no();
		}
		
		return "redirect:"+url;
	}
	
	/*********************************************************************************
	 * 비밀번호 체크
	 *********************************************************************************/
	@ResponseBody
	@RequestMapping(value="pwdConfirm.do", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")	
	public String pwdConfirm(QnaVO qvo) {
		logger.info("pwdConfirm 호출 성공");
		String value = "";
		
		int result = qnaService.pwdConfirm(qvo);
		
		if (result == 1) {
			value = "성공";
		} else {
			value = "실패";
		}
		logger.info("result = " + result + " value = " + value);
		
		return value;	
	}
	
	/*********************************************************************************
	 * 글삭제
	 *********************************************************************************/
	@RequestMapping(value="/qnaDelete.do")
	public String qnaDelete(QnaVO qvo, HttpServletRequest request) throws IOException {
		logger.info("qnaDelete 호출 성공");
		
		int result = 0;
		String url = "";
		if (!qvo.getQ_img().isEmpty()) {
			FileUploadUtil.fileDelete(qvo.getQ_img(), request);
		}
		result = qnaService.qnaDelete(qvo);		
		if (result == 1) {
			url = "/qna/qnaList.do";
		} else {
			url = "/qna/qnaDetail.do?q_no="+qvo.getQ_no();
		}
		return "redirect:"+url;
	}
	
	/*************************************************
	    * 마이페이지 내정보 확인
	    *************************************************/
	   @RequestMapping(value="/pwdCheck.do", method = RequestMethod.GET)
	   public ModelAndView pwdForm(LoginVO lvo, @ModelAttribute("qna") QnaVO qvo, ModelAndView mav, HttpSession session) {
	      logger.info("pwdForm 호출 성공");
	      
	      LoginVO login =(LoginVO)session.getAttribute("login");		//@ModelAttribute("qna") 매개변수로 qvo 넣어서 q_no 사용할수있께함 ex) ${qna.q_no}
	       if(login == null) {
	          mav.setViewName("login/login");    
	          return mav;      
	       }else {          
	    	   mav.setViewName("qna/pwdCheck");
	           return mav;
	       }
	   }
	
	
		/*************************************************
	    * 마이페이지 내정보 확인
	    *************************************************/
	   @RequestMapping(value="/pwdCheck.do", method = RequestMethod.POST)
	   public ModelAndView pwdCheck(LoginVO lvo, QnaVO qvo, ModelAndView mav, HttpSession session) {
	      logger.info("pwdCheck 호출 성공");
	      
	      LoginVO login =(LoginVO)session.getAttribute("login");
	       if(login == null) {
	          mav.setViewName("login/login");    
	          return mav;      
	       }else {          
	         String userId = login.getC_id();
	         String userPw = lvo.getC_pwd();
	         LoginVO loginCheckResult = loginService.loginSelect(userId, userPw);
	         
	         if (loginCheckResult == null) {
	            mav.addObject("status", 1);		//틀렸을 경우
	            mav.setViewName("qna/pwdCheck");
	            return mav;
	         } else { // 일치하면
	            mav.setViewName("redirect:/qna/qnaDetail.do?q_no="+ qvo.getQ_no());
	            return mav;
	         }
	       }
	   }
	
}
