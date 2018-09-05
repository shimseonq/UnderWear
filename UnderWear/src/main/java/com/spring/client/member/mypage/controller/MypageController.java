package com.spring.client.member.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.client.login.service.LoginService;
import com.spring.client.login.vo.LoginVO;
import com.spring.client.member.basket.service.BasketService;
import com.spring.client.member.basket.vo.BasketVO;
import com.spring.client.member.rank.service.RankService;
import com.spring.client.member.rank.vo.RankVO;
import com.spring.client.member.service.MemberService;
import com.spring.client.member.vo.MemberVO;
import com.spring.client.order.service.OrderService;
import com.spring.client.order.vo.OrderVO;
import com.spring.client.pay.service.PayService;
import com.spring.client.pay.vo.PayVO;

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

	@Autowired
	private LoginService loginService;	

	@Autowired
	private PayService payService;

	@Autowired
	private OrderService orderService;

	/*************************************************
	 * ���������� �ֹ� ��ȸ
	 *************************************************/
	@RequestMapping(value="/mypage.do", method = RequestMethod.GET)
	public String customerOrderList(PayVO pvo, Model model, HttpSession session) {
		logger.info("mypage ȣ�� ����");

		LoginVO login =(LoginVO)session.getAttribute("login");
		if(login == null) {
			return "login/login";	        
		}else {	
			pvo.setC_id(login.getC_id());

			List<PayVO> payList = payService.payList(pvo);	

			model.addAttribute("payList", payList);

			return "mypage/mypage";
		}
	}

	/*************************************************
	 * ���������� ���ſϷ�
	 *************************************************/
	@RequestMapping(value="/orderFin.do", method = RequestMethod.POST)
	public String orderFinish(OrderVO ovo, Model model, HttpSession session) {
		logger.info("order Finishȣ�� ����");
		LoginVO login =(LoginVO)session.getAttribute("login");

		if(login == null) {
			return "login/login";	        
		}else {	
			ovo.setC_id(login.getC_id());

			orderService.orderFinish(ovo);

			return "redirect:/mypage/mypage.do";
		}		
	}

	/*************************************************
	 * ���������� ��ٱ��� ��ȸ
	 *************************************************/
	@RequestMapping(value="/basket.do", method = RequestMethod.GET)
	public String customerBasketList(BasketVO bvo, Model model, HttpSession session) {
		logger.info("basket ȣ�� ����");

		LoginVO login =(LoginVO)session.getAttribute("login");

		if(login == null) {
			return "login/login";	        
		}else {	
			bvo.setC_id(login.getC_id());

			List<BasketVO> basketList = basketService.basketList(bvo);	

			model.addAttribute("basketList", basketList);

			return "mypage/basket";
		}		
	}

	/*************************************************
	 * ���������� ��ٱ��� ����
	 *************************************************/
	@RequestMapping(value="/basketDelete.do", method = RequestMethod.GET)
	public String basketDelete(BasketVO bvo, @RequestParam String b_number, Model model, HttpSession session) {
		logger.info("basket delete ȣ�� ����");
		String[] b_num = b_number.split(",");
		LoginVO login =(LoginVO)session.getAttribute("login");

		if(login == null) {
			return "login/login";	        
		}else {	
			bvo.setC_id(login.getC_id());

			basketService.basketDelete(bvo, b_num);

			return "redirect:/mypage/basket.do";
		}		
	}

	/*************************************************
	 * ���������� ������ Ȯ��
	 *************************************************/
	@RequestMapping(value="/pwdCheck.do", method = RequestMethod.GET)
	public ModelAndView infocheck(@ModelAttribute LoginVO lvo, ModelAndView mav, HttpSession session) {
		logger.info("mypage ȣ�� ����");

		LoginVO login =(LoginVO)session.getAttribute("login");

		if(login == null) {
			mav.setViewName("login/login");	 
			return mav;      
		}else {		    
			String userId = lvo.getC_id();
			String userPw = lvo.getC_pwd();
			LoginVO loginCheckResult = loginService.loginSelect(userId, userPw);
			if (loginCheckResult == null) {
				mav.addObject("status",1 );
				mav.setViewName("mypage/pwdCheck");
				return mav;
			} else { // ��ġ�ϸ�
				session.setAttribute("login",loginCheckResult);
				/*mav.addObject("login", loginCheckResult);*/
				mav.setViewName("mypage/myinfo");
				return mav;
			}
		}
	}

	/*************************************************
	 * ���������� �������� ��ȸ
	 *************************************************/
	@RequestMapping(value="/myinfo.do", method = RequestMethod.POST)
	public String customeriInfoList(MemberVO mvo, Model model, HttpSession session) {
		logger.info("mypage ȣ�� ����");

		LoginVO login =(LoginVO)session.getAttribute("login");

		if(login == null) {    	  
			return "login/login";

		}else {
			mvo.setC_id(login.getC_id());

			MemberVO myInfo = new MemberVO();
			myInfo = memberService.myInfo(mvo);

			model.addAttribute("myInfo", myInfo);
			return "mypage/myinfo";
		}
	}

	/*************************************************
	 * ���������� �����Ȳ ��ȸ
	 *************************************************/
	@RequestMapping(value="/rank.do", method = RequestMethod.GET)
	public String customerRankList(RankVO rvo, Model model, HttpSession session) {
		logger.info("rank ȣ�� ����");

		LoginVO login =(LoginVO)session.getAttribute("login");

		if(login == null) {
			return "login/login";	        
		}else {	
			rvo.setC_id(login.getC_id());

			List<RankVO> rankList = rankService.rankList(rvo);	
			model.addAttribute("rankList", rankList);

			String myRank = rankService.myRank(rvo);
			model.addAttribute("myRank",myRank);

			return "mypage/rank";
		}
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
