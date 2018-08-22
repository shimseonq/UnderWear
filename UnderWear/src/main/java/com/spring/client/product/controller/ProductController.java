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
		
	@Autowired	//������ ����
	private ProductService productService;
	
	/*�۸�� �����ϱ� (����¡ ó���� ������ ���)*/

	@RequestMapping(value="/productList.do", method = RequestMethod.GET)
	public String productList(@ModelAttribute ("data")ProductVO pvo, Model model) {
		logger.info("boardList ȣ�� ����");
		
		List<ProductVO> productList = productService.productList(pvo);	
		
		model.addAttribute("productList", productList);

		return "product/productList";
	}
	
	/*�� �󼼺��� ����*/
	/*@RequestMapping(value="productDetail.do", method = RequestMethod.GET)
	public String productDetail(ProductVO pvo, Model model) {
		logger.info("productDetail ȣ�� ����");
		logger.info("p_code = " + pvo.getP_code());
		
		ProductVO detail = new ProductVO();
		detail = productService.productDetail(pvo);
		
		model.addAttribute("detail", detail);
		return "product/productDetail";
	}*/
	
	/*****************************************************************************************
	 * �۾��� �����ϱ�(÷�������� ������ �Է��۾�)
	 *****************************************************************************************/
	@RequestMapping(value="/productInsert.do", method=RequestMethod.POST)
	public String boardInsert(ProductVO pvo, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("boardInsert ȣ�� ����");
		
		// Ȯ�� �� �ּ� ó��
		/*logger.info("fileName : " + bvo.getFile().getOriginalFilename());
		logger.info("b_title : " + bvo.getB_title());*/
		
		// �����߻� ��� �ʿ��� �ÿ� ���
		int result = 0;
		String url = "";
		
		if(!pvo.getFile().isEmpty()) {
			String p_file = FileUploadUtil.fileUpload(pvo.getFile(), request, "product");		/*request = ��ο� ���� ����. board�� ��θ� Ȯ��.*/
			pvo.setP_file(p_file);
		} else {
			pvo.setP_file("");
		}
		
		result = productService.productInsert(pvo);
		
		
		if (result == 1) {
			url = "/product/productList.do";	//insert�� ������ ������ redirect ��. ����ó��.
		} else {
			model.addAttribute("code", 1);	// ������ �߻��� ���� code���� 1
			url = "/product/writeForm.do";
		}
		
		return "redirect:"+url;		// if�� redirect�� ��ġ�� �Ѿ�� �ʴ´�.
	}
}