package com.spring.client.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.product.service.ProductService;
import com.spring.client.product.vo.ProductVO;
import com.spring.common.file.FileUploadUtil;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	Logger logger = Logger.getLogger(ProductController.class);
		
	@Autowired	//의존성 주입
	private ProductService productService;
	
	/*글목록 구현하기 (페이징 처리를 제외한 목록)*/

	@RequestMapping(value="/productList.do", method = RequestMethod.GET)
	public String productList(@ModelAttribute ("data")ProductVO pvo, Model model) {
		logger.info("boardList 호출 성공");
		
		List<ProductVO> productList = productService.productList(pvo);	
		
		model.addAttribute("productList", productList);

		return "product/productList";
	}
	
	/*글 상세보기 구현*/
	/*@RequestMapping(value="productDetail.do", method = RequestMethod.GET)
	public String productDetail(ProductVO pvo, Model model) {
		logger.info("productDetail 호출 성공");
		logger.info("p_code = " + pvo.getP_code());
		
		ProductVO detail = new ProductVO();
		detail = productService.productDetail(pvo);
		
		model.addAttribute("detail", detail);
		return "product/productDetail";
	}*/
	
	/*****************************************************************************************
	 * 글쓰기 구현하기(첨부파일을 포함한 입력작업)
	 *****************************************************************************************/
	@RequestMapping(value="/productInsert.do", method=RequestMethod.POST)
	public String boardInsert(ProductVO pvo, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("boardInsert 호출 성공");
		
		// 확인 후 주석 처리
		/*logger.info("fileName : " + bvo.getFile().getOriginalFilename());
		logger.info("b_title : " + bvo.getB_title());*/
		
		// 오류발생 제어가 필요할 시에 사용
		int result = 0;
		String url = "";
		
		if(!pvo.getFile().isEmpty()) {
			String p_file = FileUploadUtil.fileUpload(pvo.getFile(), request, "product");		/*request = 경로에 대한 구문. board는 경로를 확인.*/
			pvo.setP_file(p_file);
		} else {
			pvo.setP_file("");
		}
		
		result = productService.productInsert(pvo);
		
		
		if (result == 1) {
			url = "/product/productList.do";	//insert시 문제가 없으면 redirect 함. 정상처리.
		} else {
			model.addAttribute("code", 1);	// 오류가 발생한 경우는 code값이 1
			url = "/product/writeForm.do";
		}
		
		return "redirect:"+url;		// if와 redirect가 겹치면 넘어가지 않는다.
	}
}