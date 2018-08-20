package com.spring.client.product.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.product.service.ProductService;
import com.spring.client.product.vo.BigCategoryVO;
import com.spring.client.product.vo.PriceVO;
import com.spring.client.product.vo.ProductVO;
import com.spring.client.product.vo.SmallCategoryVO;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	Logger logger = Logger.getLogger(ProductController.class);
		
	@Autowired	//의존성 주입
	private ProductService productService;
	private ProductService priceService;
	private ProductService bigCategoryService;
	private ProductService smallCategoryService;
	/*글목록 구현하기 (페이징 처리를 제외한 목록)*/
	/*,*/
	@RequestMapping(value="/productList.do", method = RequestMethod.GET)
	public String productList(@ModelAttribute ("data")ProductVO pvo,PriceVO prvo,BigCategoryVO bvo,SmallCategoryVO svo, Model model) {
		logger.info("boardList 호출 성공");
		
		List<ProductVO> productList = productService.productList(pvo);	
		/*List<PriceVO> priceList = priceService.priceList(prvo);	
		
		List<SmallCategoryVO> smallCategoryList = smallCategoryService.smallCateList(svo);*/
		
		model.addAttribute("productList", productList);
		/*model.addAttribute("priceList", priceList);
		
		model.addAttribute("smallCategoryList", smallCategoryList);*/
		return "product/productList";
	}	
}
