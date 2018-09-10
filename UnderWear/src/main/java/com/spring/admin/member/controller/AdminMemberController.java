package com.spring.admin.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.admin.member.rank.service.AdminRankService;
import com.spring.admin.member.service.AdminMemberService;
import com.spring.client.member.rank.vo.RankVO;
import com.spring.client.member.vo.MemberVO;

@Controller 
@RequestMapping(value = "/admin")
public class AdminMemberController {
	Logger logger = Logger.getLogger(AdminMemberController.class);

	@Autowired
	private AdminMemberService adminMemberService;
	 
	@Autowired
	private AdminRankService adminRankService;

	/*************************************************
	 * 회원 리스트 구현하기
	 *************************************************/
	@RequestMapping(value = "/member/memberList.do", method = RequestMethod.GET)
	public String memberList(MemberVO mvo, Model model) {
		logger.info("memberList 호출 성공");

		List<MemberVO> memberList = adminMemberService.memberList(mvo);
		model.addAttribute("memberList", memberList);

		return "admin/member/memberList";
	}
	/*************************************************
	 * 관리자 페이지 등급현황 조회
	 *************************************************/
	@RequestMapping(value="/member/rank.do", method = RequestMethod.GET)
	public String customerRankList(RankVO rvo, Model model, HttpSession session ,MemberVO mvo) {
		logger.info("rank 호출 성공");
		
		List<MemberVO> memberList = adminMemberService.memberList(mvo);
		List<RankVO> rankList = adminRankService.rankList(rvo);	
		model.addAttribute("rankList", rankList);
		
		String myRank = adminRankService.myRank(rvo);
		model.addAttribute("memberList", memberList);
		model.addAttribute("myRank",myRank);
		
		return "admin/rank/rankupdate";
	}
}
