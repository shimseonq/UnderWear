package com.spring.client.order.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.spring.client.member.basket.service.BasketService;
import com.spring.client.member.basket.vo.BasketVO;
import com.spring.client.order.service.OrderService;
import com.spring.client.order.vo.OrderVO;

@Controller
@RequestMapping(value="/order")
public class OrderController {
	Logger logger = Logger.getLogger(OrderController.class);
	
	@Autowired
	private BasketService basketService;
	
	@Autowired
	private OrderService orderService;
	
	/*************************************************
	 * 주문 리스트 조회
	 **************************************************/
	@RequestMapping(value="/orderForm.do", method = RequestMethod.POST)
	public String orderList(BasketVO bvo, @RequestParam String b_number, Model model) {
		logger.info("order 호출 성공");
		logger.info("b_number :" +b_number);
		String[] b_num = b_number.split(",");
		
		List<BasketVO> basketOrder = basketService.basketOrder(bvo,b_num);	
		
		model.addAttribute("basketOrder", basketOrder);
			
		return "order/orderForm";
	}
	
	/*************************************************
	 * 주문 입력
	 *************************************************/
	@RequestMapping(value="/orderInsert.do")
	public ResponseEntity<String> orderInsert(@RequestBody OrderVO ovo)	{
		logger.info("orderInsert 호출 성공");
		ResponseEntity<String> entity = null;
		int result;
		try {
			result = orderService.orderInsert(ovo);
			if(result==1) {
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}
		}catch(Exception e) {
			e.printStackTrace();
			entity= new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
