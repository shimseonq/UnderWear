package com.spring.admin.sale.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.admin.sale.service.AdminSaleService;
import com.spring.client.order.vo.OrderVO;
import com.spring.client.sale.vo.SaleVO;

@Controller
@RequestMapping(value="/admin")
public class AdminSaleController {
	Logger logger = Logger.getLogger(AdminSaleController.class);
	
	@Autowired
	private AdminSaleService adminSaleService;
	
	/*************************************************
	 * 주문 리스트 조회
	 **************************************************/
	@RequestMapping(value="/sale/saleList.do", method = RequestMethod.GET)
	public String saleList(SaleVO svo, Model model) {
		logger.info("saleList 호출 성공");

		List<SaleVO> saleList = adminSaleService.adminSaleList(svo);
		
		model.addAttribute("saleList", saleList);
		
		return "admin/sale/saleList";
	}
	
}
