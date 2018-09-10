package com.spring.admin.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.admin.member.rank.service.AdminRankService;
import com.spring.admin.member.service.AdminMemberService;
import com.spring.client.login.vo.LoginVO;
import com.spring.client.member.rank.vo.RankVO;
import com.spring.client.member.vo.MemberVO;
import com.spring.client.order.vo.OrderVO;

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
	@RequestMapping(value="/member/rankupdate.do", method = RequestMethod.GET)
	public String customerRankList(RankVO rvo, Model model, HttpSession session ,MemberVO mvo) {
		logger.info("rank 호출 성공");
		
		List<RankVO> rankList = adminRankService.rankList(rvo);	
		List<MemberVO> memberRank = adminMemberService.memberRank(mvo);
		
		model.addAttribute("rankList", rankList);
		
		String myRank = adminRankService.myRank(rvo);
		model.addAttribute("memberRank", memberRank);
		model.addAttribute("myRank",myRank);
		
		return "admin/member/rankupdate";
	}
	/*************************************************
	 * 배송정보 업데이트
	 *************************************************/
	@RequestMapping(value="/rank/rankPaysUpdate.do", method = RequestMethod.GET)
	public String rankUpdate(MemberVO mvo, @RequestParam String o_number, Model model, HttpSession session) {
		logger.info("rankPaysUpdate 호출 성공");
		String[] c_num = o_number.split(",");
		logger.info(c_num);
		adminRankService.rankPaysUpdate(mvo, c_num);
	 		
		return "redirect:/admin/member/rankupdate.do";
			
	}

}
