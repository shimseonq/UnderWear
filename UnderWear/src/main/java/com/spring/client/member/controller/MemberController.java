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

import com.spring.client.login.vo.LoginVO;
import com.spring.client.member.service.MemberService;
import com.spring.client.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	Logger logger = Logger.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	/*
	 * @Autowired private LoginService loginService;
	 */

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
	public String userIdConfirm(@RequestParam("userId") String userId) {
		int result = memberService.userIdConfirm(userId);
		return result + "";
	}

	/***********************************************************************
	 * 회원 가입 처리
	 ***********************************************************************/
	@RequestMapping(value = "join.do", method = RequestMethod.POST)
	public ModelAndView memberInsert(MemberVO mvo) {
		logger.info("join.do post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		int result = 0;
		result = memberService.memberInsert(mvo);

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
	
	/**************************************************************
	 * 회원 수정 처리(AOP 예외 처리 후)
	 **************************************************************//*
	@RequestMapping(value="/modify.do", method = RequestMethod.POST)
	public ModelAndView memberModifyProcess(MemberVO mvo, HttpSession session, ModelAndView mav){
		logger.info("modift.do POST방식에 의한 메서드 호출 성공");
		
		LoginVO login = (LoginVO)session.getAttribute("login");
		
		if(login==null){
			mav.setViewName("member/login");
			return mav;
			}
			 // 세션으로 얻은 로그인 정보를 가지고 다시 회원테이블에 존재하는 확인
			 mvo.setUserId(login.getUserId());
			 MemberVO vo = memberService.memberSelect(mvo.getUserId());
			 // 기존 비빌번호로 회원정보를 확인하여 일치하면 수정 가능하도록 확인 작업
			 if (loginService.loginSelect(mvo.getUserId(), mvo.getOldUserPw()) == null ) {
			 mav.addObject("status", 1);
			 mav.addObject("member",vo);
			 mav.setViewName("member/modify");
			 return mav;
			 } 
			 memberService.memberUpdate(mvo);
			 mav.setViewName("redirect:/member/logout.do");
			 return mav;
	}*/
}
