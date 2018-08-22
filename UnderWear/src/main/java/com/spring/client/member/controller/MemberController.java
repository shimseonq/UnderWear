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
	 * ȸ�� ���� ��
	 **************************************************/
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String joinForm(Model model) {
		logger.info("join.do get ��Ŀ� ���� �޼��� ȣ�� ����");
		return "member/join";
	}

	/********************************************************
	 * ����� ���̵� �ߺ� üũ �޼���
	 ******************************************************/
	@ResponseBody
	@RequestMapping(value = "/userIdConfirm.do", method = RequestMethod.POST)
	public String userIdConfirm(@RequestParam("userId") String userId) {
		int result = memberService.userIdConfirm(userId);
		return result + "";
	}

	/***********************************************************************
	 * ȸ�� ���� ó��
	 ***********************************************************************/
	@RequestMapping(value = "join.do", method = RequestMethod.POST)
	public ModelAndView memberInsert(MemberVO mvo) {
		logger.info("join.do post ��Ŀ� ���� �޼��� ȣ�� ����");
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
	 * ȸ�� ���� ó��(AOP ���� ó�� ��)
	 **************************************************************//*
	@RequestMapping(value="/modify.do", method = RequestMethod.POST)
	public ModelAndView memberModifyProcess(MemberVO mvo, HttpSession session, ModelAndView mav){
		logger.info("modift.do POST��Ŀ� ���� �޼��� ȣ�� ����");
		
		LoginVO login = (LoginVO)session.getAttribute("login");
		
		if(login==null){
			mav.setViewName("member/login");
			return mav;
			}
			 // �������� ���� �α��� ������ ������ �ٽ� ȸ�����̺� �����ϴ� Ȯ��
			 mvo.setUserId(login.getUserId());
			 MemberVO vo = memberService.memberSelect(mvo.getUserId());
			 // ���� �����ȣ�� ȸ�������� Ȯ���Ͽ� ��ġ�ϸ� ���� �����ϵ��� Ȯ�� �۾�
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
