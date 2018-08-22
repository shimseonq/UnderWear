package com.spring.client.member.mypage.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.admin.member.service.AdminMemberService;
import com.spring.client.member.vo.MemberVO;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	Logger logger = Logger.getLogger(MypageController.class);
	
	
	/*************************************************
	 * ���������� �ֹ� ��ȸ
	 *************************************************/
	@RequestMapping(value="/mypage.do", method = RequestMethod.GET)
	public String customerOrderList(MemberVO mvo, Model model) {
		logger.info("mypage ȣ�� ����");
		
		return "mypage/mypage";
	}
	
	/*************************************************
	 * ���������� ��ٱ��� ��ȸ
	 *************************************************/
	@RequestMapping(value="/basket.do", method = RequestMethod.GET)
	public String customerBasketList(MemberVO mvo, Model model) {
		logger.info("mypage ȣ�� ����");
		
		return "mypage/basket";
	}
	
	/*************************************************
	 * ���������� �������� ��ȸ
	 *************************************************/
	@RequestMapping(value="/myinfo.do", method = RequestMethod.GET)
	public String customeriInfoList(MemberVO mvo, Model model) {
		logger.info("mypage ȣ�� ����");
		
		return "mypage/myinfo";
	}
	
	/*************************************************
	 * ���������� �����Ȳ ��ȸ
	 *************************************************/
	@RequestMapping(value="/rank.do", method = RequestMethod.GET)
	public String customerRankList(MemberVO mvo, Model model) {
		logger.info("mypage ȣ�� ����");
		
		return "mypage/rank";
	}
	
	/*************************************************
	 * ���������� �Խù� ��ȸ
	 *************************************************/
	@RequestMapping(value="/myboard.do", method = RequestMethod.GET)
	public String customerBoardList(MemberVO mvo, Model model) {
		logger.info("mypage ȣ�� ����");
		
		return "mypage/myboard";
	}
}
