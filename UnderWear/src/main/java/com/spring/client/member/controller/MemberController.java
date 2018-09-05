package com.spring.client.member.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.client.login.service.LoginService;
import com.spring.client.login.vo.LoginVO;
import com.spring.client.member.rank.service.RankService;
import com.spring.client.member.service.MemberService;
import com.spring.client.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	Logger logger = Logger.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private LoginService loginService;
	@Autowired
	private RankService rankService;


	/*************************************************
	 * 회원 가입 폼
	 **************************************************/
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String joinForm(Model model) {
		logger.info("join.do get 방식에 의한 메서드 호출 성공");
		return "member/join";
	}

	/********************************************************
	 * 사용자 아이디 중복 체크 메서드
	 ******************************************************/
	@ResponseBody
	@RequestMapping(value = "/userIdConfirm.do", method = RequestMethod.POST)
	public String userIdConfirm(@RequestParam("c_id") String c_id) {
		int result = memberService.userIdConfirm(c_id);
		return result + "";
	}

	/***********************************************************************
	 * 회원 가입 처리
	 ***********************************************************************/
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public ModelAndView memberInsert(MemberVO mvo) {
		logger.info("join.do post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		int result = 0;
		result = memberService.memberInsert(mvo);
		logger.info(result);
		switch (result) {
		case 1:
			mav.addObject("errCode", 1); // userId already exist
			mav.setViewName("member/join");
			break;
		case 3:
			mav.addObject("errCode", 3);
			mav.setViewName("member/join_success"); // success to add new member_succeuss
			break;
		default:
			mav.addObject("errCode", 2); // failed to add new member
			mav.setViewName("member/join");
			break;
		}
		return mav;
	}
	
	/*************************************************
	 * 마이페이지 개인정보 수정
	 *************************************************//*
	@RequestMapping(value="/myInfoUpdate.do", method = RequestMethod.POST)
	public String myInfoUpdate(MemberVO mvo, Model model, HttpSession session) {
		logger.info("boardUpdate 호출 성공");
				
		LoginVO login =(LoginVO)session.getAttribute("login");
	    logger.info("c_id ="+login.getC_id());
		mvo.setC_id(login.getC_id());       
		mvo.setC_pwd(login.getC_pwd());
		
		int result = 0;
	    String url = "";
	    

	      result = memberService.myInfoUpdate(mvo);
	      if(result == 1) {
	         url = "/mypage/mybasket.do";
	      }else {
	    	  MemberVO myInfo = new MemberVO();
		 	  myInfo = memberService.myInfo(mvo);
				
		 	  model.addAttribute("myInfo", myInfo);
		 	 url = "/mypage/myinfo.do";
	      }
	      return url;
	}*/
	
	/**************************************************************
	 * 회원 수정 처리(AOP 예외 처리 후)
	 **************************************************************/
	@RequestMapping(value="/modify.do", method = RequestMethod.POST)
	public ModelAndView memberModifyProcess(MemberVO mvo, HttpSession session, ModelAndView mav){
		logger.info("modify.do POST방식에 의한 메서드 호출 성공");
		
		LoginVO login = (LoginVO)session.getAttribute("login");
		
		if(login==null){
			mav.setViewName("login/login");
			return mav;
			}
			 // 세션으로 얻은 로그인 정보를 가지고 다시 회원테이블에 존재하는 확인
			mvo.setC_id(login.getC_id());
			MemberVO vo = memberService.memberSelect(mvo.getC_id());
			/*String pwd = mvo.getC_pwd();
			String oldpwd = mvo.getOldUserPw();*/
			 memberService.memberUpdate(mvo);
			 mav.setViewName("mypage/modify_success");
			 return mav;
	 }
	
	/*******************************
	 * 회원 탈퇴 처리
	 * *****************************/
	@RequestMapping(value="/delete.do", method = RequestMethod.POST)
	public ModelAndView memberDelete(MemberVO mvo, HttpSession session, ModelAndView mav) {
		logger.info("delete.do get방식에 의한 메서드 호출 성공");
		
		LoginVO login = (LoginVO)session.getAttribute("login");
		
		if(login==null) {
			mav.setViewName("redirect:/login/login.do");
			return mav;
		}
		mvo.setC_id(login.getC_id());
		memberService.memberDelete(mvo);
		
		mav.setViewName("mypage/bye_success");
		return mav;
	}
	
	
}
