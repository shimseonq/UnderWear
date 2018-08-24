package com.spring.client.member.mypage.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.member.basket.service.BasketService;
import com.spring.client.member.basket.vo.BasketVO;
import com.spring.client.member.rank.service.RankService;
import com.spring.client.member.rank.vo.RankVO;
import com.spring.client.member.service.MemberService;
import com.spring.client.member.vo.MemberVO;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	Logger logger = Logger.getLogger(MypageController.class);
	
	@Autowired
	private RankService rankService;
	
	@Autowired
	private BasketService basketService;
	
	@Autowired
	private MemberService memberService;	
	
	
	/*************************************************
	 * 마이페이지 주문 조회
	 *************************************************/
	@RequestMapping(value="/mypage.do", method = RequestMethod.GET)
	public String customerOrderList(MemberVO mvo, Model model) {
		logger.info("mypage 호출 성공");
		
		return "mypage/mypage";
	}
	
	/*************************************************
	 * 마이페이지 장바구니 조회
	 *************************************************/
	@RequestMapping(value="/basket.do", method = RequestMethod.GET)
	public String customerBasketList(BasketVO bvo, Model model) {
		logger.info("basket 호출 성공");
		
		List<BasketVO> basketList = basketService.basketList(bvo);	
		
		model.addAttribute("basketList", basketList);
		
		return "mypage/basket";
	}
	
	/*************************************************
	 * 마이페이지 개인정보 조회
	 *************************************************/
	@RequestMapping(value="/myinfo.do", method = RequestMethod.GET)
	public String customeriInfoList(MemberVO mvo, Model model) {
		logger.info("mypage 호출 성공");
		
		return "mypage/myinfo";
	}
	
	/*************************************************
	 * 마이페이지 등급현황 조회
	 *************************************************/
	@RequestMapping(value="/rank.do", method = RequestMethod.GET)
	public String customerRankList(RankVO rvo, Model model) {
		logger.info("rank 호출 성공");
		
		List<RankVO> rankList = rankService.rankList(rvo);	
		model.addAttribute("rankList", rankList);
		
		MemberVO mvo = new MemberVO();
		String myRank = memberService.myRank(mvo);
		model.addAttribute("myRank",myRank);
		
		return "mypage/rank";
	}
	
	/*************************************************
	 * 마이페이지 게시물 조회
	 *************************************************/
	@RequestMapping(value="/myboard.do", method = RequestMethod.GET)
	public String customerBoardList(MemberVO mvo, Model model) {
		logger.info("mypage 호출 성공");
		
		return "mypage/myboard";
	}
}
