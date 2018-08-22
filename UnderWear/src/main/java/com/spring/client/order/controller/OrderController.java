package com.spring.client.order.controller;

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
@RequestMapping(value="/order")
public class OrderController {
	Logger logger = Logger.getLogger(OrderController.class);
	
	
	/*************************************************
	 * ���������� �ֹ� ��ȸ
	 *************************************************/
	@RequestMapping(value="/orderForm.do", method = RequestMethod.GET)
	public String customerOrderList(MemberVO mvo, Model model) {
		logger.info("orderForm ȣ�� ����");
		
		return "order/orderForm";
	}
	
	/*************************************************
	 * ���������� �ֹ� ��ȸ
	 *************************************************/
	@RequestMapping(value="/orderForm.do", method = RequestMethod.GET)
	public String customerOrder(MemberVO mvo, Model model) {
		logger.info("orderForm ȣ�� ����");
		
		return "order/orderForm";
	}

}
