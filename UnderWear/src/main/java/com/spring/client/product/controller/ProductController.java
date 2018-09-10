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

import com.spring.client.member.basket.service.BasketService;
import com.spring.client.product.service.ProductService;
import com.spring.client.product.vo.ProductVO;
import com.spring.common.file.FileUploadUtil;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	Logger logger = Logger.getLogger(ProductController.class);
		
	@Autowired	//의존성 주입
	private ProductService productService;
	@Autowired 
	private BasketService basketService;
	
	/*글목록 구현하기 (페이징 처리를 제외한 목록)*/
	/*,*/
	@RequestMapping(value="/productList.do", method = RequestMethod.GET)
	public String productList(@ModelAttribute ("data")ProductVO pvo, Model model) {
		logger.info("productList 호출 성공");
		
		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("productList", productList);
		
		return "product/productList";
	}
	
	//상세
	@RequestMapping(value="productDetail.do", method=RequestMethod.GET)
	public String productDetail(ProductVO pvo, Model model) {
		logger.info("productDetail 호출 성공");
		logger.info("p_code = " + pvo.getP_code());
		
		ProductVO detail = new ProductVO();
		detail = productService.productDetail(pvo);
		
		if(detail != null && (!detail.equals(""))) {
			detail.setP_content(detail.getP_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		return "product/productDetail";
	}
	
	//삭제
	@RequestMapping(value="/productDelete.do")
	public String productDelete(ProductVO pvo, HttpServletRequest request) throws IOException{
		logger.info("productDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		//이미지 파일
		if (!pvo.getP_file().isEmpty()) {
			FileUploadUtil.fileDelete(pvo.getP_file(), request);
		}
		
		result = productService.productDelete(pvo);
		
		if(result == 1) {
			url = "/product/productList.do";
		}else {
			url = "/product/productDelete.do?p_code="+pvo.getP_code();
		}
		
		return "redirect:"+url;
	}
	
	//수정
	@RequestMapping(value="/productUpdate.do")
	public String updateForm(ProductVO pvo, Model model) {
		logger.info("updateForm 호출 성공");
		logger.info(pvo.getP_code());
		logger.info("p_code = " + pvo.getP_code());
		
		ProductVO updateData = new ProductVO();
		updateData = productService.productDetail(pvo);
		
		model.addAttribute("updateData", updateData);
		return "product/updateForm";
	}
	
	
}
