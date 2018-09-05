package com.spring.admin.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.admin.order.service.AdminOrderService;
import com.spring.client.login.vo.LoginVO;
import com.spring.client.member.vo.MemberVO;
import com.spring.client.order.controller.OrderController;
import com.spring.client.order.vo.OrderVO;

@Controller
@RequestMapping(value="/admin")
public class AdminOrderController {
	Logger logger = Logger.getLogger(AdminOrderController.class);
	
	@Autowired
	private AdminOrderService adminOrderService;
	
	/*************************************************
	 * 주문 리스트 조회
	 **************************************************/
	@RequestMapping(value="/order/orderList.do", method = RequestMethod.GET)
	public String orderList(OrderVO ovo, Model model) {
		logger.info("order 호출 성공");

		List<OrderVO> OrderList = adminOrderService.adminOrderList(ovo);
		
		model.addAttribute("orderList", OrderList);
		
		return "admin/order/orderList";
	}
	
	/*************************************************
	 * 배송정보 업데이트
	 *************************************************/
	@RequestMapping(value="/order/deliveryUpdate.do", method = RequestMethod.GET)
	public String deliveryUpdate(OrderVO ovo, @RequestParam String o_number,Model model, HttpSession session) {
		logger.info("order Finish호출 성공");
		String[] o_num = o_number.split(",");
		LoginVO login =(LoginVO)session.getAttribute("login");
		
	    if(login == null) {
	         return "login/login";	        
	    }else {	
	    	ovo.setC_id(login.getC_id());

	 		adminOrderService.deliveryUpdate(ovo, o_num);
	 		
			return "redirect:/admin/order/orderList.do";
	    }		
	}
	
}
