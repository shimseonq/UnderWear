package com.spring.client.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.login.vo.LoginVO;
import com.spring.client.member.basket.vo.BasketVO;
import com.spring.client.product.service.ProductService;
import com.spring.client.product.vo.ProductVO;
import com.spring.common.file.FileUploadUtil;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	Logger logger = Logger.getLogger(ProductController.class);
		
	@Autowired	//������ ����
	private ProductService productService;
	
	
	
	/*�۸�� �����ϱ� (����¡ ó���� ������ ���)*/
	/*,*/
	@RequestMapping(value="/productList.do", method = RequestMethod.GET)
	public String productList(@ModelAttribute ("data")ProductVO pvo, Model model) {
		logger.info("productList ȣ�� ����");
		
		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("productList", productList);
		
		return "product/productList";
	}
	
	//��
	@RequestMapping(value="productDetail.do", method=RequestMethod.GET)
	public String productDetail(ProductVO pvo, Model model, BasketVO bvo, HttpSession session) {
		logger.info("productDetail ȣ�� ����");
		logger.info("p_code = " + pvo.getP_code());
		
		ProductVO detail = new ProductVO();
		detail = productService.productDetail(pvo);
		
		
		
		if(detail != null && (!detail.equals(""))) {
			detail.setP_content(detail.getP_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		return "product/productDetail";
	}
	
	//����
	@RequestMapping(value="/productDelete.do")
	public String productDelete(ProductVO pvo, HttpServletRequest request) throws IOException{
		logger.info("productDelete ȣ�� ����");
		
		int result = 0;
		String url = "";
		
		//�̹��� ����
		if (!pvo.getImg_image().isEmpty()) {
			FileUploadUtil.fileDelete(pvo.getImg_image(), request);
		}
		
		result = productService.productDelete(pvo);
		
		if(result == 1) {
			url = "/product/productList.do";
		}else {
			url = "/product/productDelete.do?p_code="+pvo.getP_code();
		}
		
		return "redirect:"+url;
	}
	
	//����
	@RequestMapping(value="/productUpdate.do")
	public String updateForm(ProductVO pvo, Model model) {
		logger.info("updateForm ȣ�� ����");
		logger.info(pvo.getP_code());
		logger.info("p_code = " + pvo.getP_code());
		
		ProductVO updateData = new ProductVO();
		updateData = productService.productDetail(pvo);
		
		model.addAttribute("updateData", updateData);
		return "product/updateForm";
	}
	
	
	@RequestMapping(value="/productThumbnail.do")
	public String productThumbnail(@ModelAttribute ("data")ProductVO pvo, Model model) {
		logger.info("productThumbnail ȣ�� ����");
		
		List<ProductVO> productThumbnail = productService.productThumbnail(pvo);
		model.addAttribute("productThumbnail", productThumbnail);
		
		return "product/productThumbnail";
	}
	
	
}
