package com.spring.client.order.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.admin.member.service.AdminMemberService;
import com.spring.client.member.basket.service.BasketService;
import com.spring.client.member.basket.vo.BasketVO;
import com.spring.client.member.vo.MemberVO;

@Controller
@RequestMapping(value="/order")
public class OrderController {
	Logger logger = Logger.getLogger(OrderController.class);
	
	@Autowired
	private BasketService basketService;
	
	
	/*************************************************
	 * 마이페이지 주문 조회
	 *************************************************/
	@RequestMapping(value="/orderForm.do", method = RequestMethod.POST)
	public String orderList(BasketVO bvo, Model model) {
		logger.info("order 호출 성공");
		logger.info(bvo.getB_no());
		List<BasketVO> orderList = basketService.basketList(bvo);	
			
		model.addAttribute("orderList", orderList);
			
		return "order/orderForm";
	}
}
