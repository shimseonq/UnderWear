package com.spring.client.sale.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.client.sale.service.SaleService;
import com.spring.client.sale.vo.SaleVO;

@Controller
@RequestMapping(value="/sale")
public class SaleController {
	Logger logger = Logger.getLogger(SaleController.class);
	
	@Autowired
	private SaleService saleService;
	
	/***********************************************************************
	 * 주문입력
	 ***********************************************************************/
	@RequestMapping(value = "/saleInsert.do")
	public ModelAndView saleInsert(SaleVO svo) {
		logger.info("orderInsert 호출 성공");
		ModelAndView mav = new ModelAndView();

		int result = 0;
		
		result = saleService.saleInsert(svo);
		logger.info(result);
		
		if(result == 1) {	
			mav.setViewName("mypage/mypage");
		}else {
			mav.setViewName("mypage/basket");
		}
		return mav;
	}
}