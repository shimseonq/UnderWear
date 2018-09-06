package com.spring.client.pay.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.client.member.basket.vo.BasketVO;
import com.spring.client.pay.service.PayService;
import com.spring.client.pay.vo.PayVO;

@Controller
@RequestMapping(value="/pay")
public class PayController {
	Logger logger = Logger.getLogger(PayController.class);
	
	@Autowired
	private PayService payService;
	
}