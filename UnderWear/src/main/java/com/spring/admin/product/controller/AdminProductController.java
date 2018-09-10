package com.spring.admin.product.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.admin.image.service.AdminImageService;
import com.spring.admin.image.vo.AdminImageVO;
import com.spring.admin.product.service.AdminProductService;
import com.spring.admin.product.vo.AdminProductVO;
import com.spring.client.product.service.ProductService;
import com.spring.common.file.FileUploadUtil;

@Controller
@RequestMapping(value="/admin")
public class AdminProductController {
	Logger logger = Logger.getLogger(AdminProductController.class);

	@Autowired	//������ ����
	private AdminProductService adminProductService;

	@Autowired
	private AdminImageService adminImageService;
	
	@Autowired
	private ProductService productService;

	/*�۸�� �����ϱ� (����¡ ó���� ������ ���)*/

	@RequestMapping(value="/product/productList.do", method = RequestMethod.GET)
	public String productList(@ModelAttribute ("data")AdminProductVO pvo, Model model) {
		logger.info("adminProductList ȣ�� ����");

		List<AdminProductVO> productList = adminProductService.productList(pvo);	
		//System.out.println(productList.toString());
		model.addAttribute("productList", productList);

		return "admin/product/productList";
	}


	/*****************************************************************************************
	 * �۾��� �����ϱ�(÷�������� ������ �Է��۾�)
	 *****************************************************************************************/
	@RequestMapping(value="/product/productInsert.do", method=RequestMethod.POST)
	public String productInsert(AdminProductVO pvo, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("adminProductInsert ȣ�� ����");

		/*// Ȯ�� �� �ּ� ó��
		logger.info("fileName : " + pvo.getFiles().getOriginalFilename());
		logger.info("p_name : " + pvo.getP_name());*/

		// �����߻� ��� �ʿ��� �ÿ� ���
		int result = 0;
		String url = "";


		result = adminProductService.productInsert(pvo, request);


		if (result == 1) {
			url = "/admin/product/productList.do";	//insert�� ������ ������ redirect ��. ����ó��.
		} else {
			model.addAttribute("code", 1);	// ������ �߻��� ���� code���� 1
			url = "/admin/product/writeForm.do";
		}

		return "redirect:"+url;		// if�� redirect�� ��ġ�� �Ѿ�� �ʴ´�.0
	}



	/***************************************************************
	 *  �� ���� �� ����ϱ�
	 ***************************************************************/
	@RequestMapping(value="/product/writeForm.do")
	public String writeForm() {
		logger.info("adminWriteForm ȣ�� ����");

		return "admin/product/writeForm";
	}

	/***************************************************************
	 *  �� ���� �� ����ϱ�
	 ***************************************************************/
	@RequestMapping(value="/product/updateForm.do")
	public String updateForm(AdminProductVO pvo ,Model model) {
		logger.info("adminUpdateForm ȣ�� ����");
		
		logger.info("p_code = " + pvo.getP_code());
		
		AdminProductVO updateData = new AdminProductVO();
		updateData = adminProductService.productDetail(pvo);
		
		List<AdminImageVO> imageUpdate = adminProductService.imageUpdate(pvo);	
		model.addAttribute("imageUpdate", imageUpdate);

		model.addAttribute("updateData", updateData);

		return "admin/product/updateForm";
	}


	/****************************************************************
	 * genderdep : ī�װ� ��ȯ
	 * @param mapper
	 * @return
	 ****************************************************************/	
	@ResponseBody
	@RequestMapping(value="/product/bigCategory.do", method = RequestMethod.GET, produces = "text/plain; charset=UTF-8")
	public String bigCategory(ObjectMapper mapper) {
		String bigcate = adminProductService.bigCategory(mapper);
		return bigcate;
	}

	@ResponseBody
	@RequestMapping(value="/product/smallCategory.do", method = RequestMethod.GET, produces = "text/plain; carset=UTF-8")
	public String smallCategory(@RequestParam("bigct_no") int bigct_no, ObjectMapper mapper) {
		String bigcate = adminProductService.smallCategory(bigct_no, mapper);
		return bigcate;
	}

	/******************************************************************
	 * �� ���� 
	 ******************************************************************/
	@RequestMapping(value="/product/productUpdate.do", method=RequestMethod.POST, produces = "text/plain; carset=UTF-8")
	public String productUpdate(AdminProductVO pvo, Model model, HttpServletRequest request) throws IOException {
		logger.info("adminProductUpdate ȣ�� ����");

		int result = 0;
		String url = "";
		String img_image = "";

		logger.info("================ p_code = " + pvo.getP_code());
		result = adminProductService.productUpdate(pvo, request);

		if (result == 1) {
			url = "productDetail.do?p_code="+pvo.getP_code();
		} else {
			url = "updateForm.do?p_code="+pvo.getP_code();
		}

		//model.addAttribute("updateData", result);
		return "redirect:"+url;
/*		AdminProductVO updateData = new AdminProductVO();
		updateData = adminProductService.productDetail(pvo);
		
		model.addAttribute("updateData", updateData);

		return "product/updateForm";*/
	}

	/************************************************************
	 * �� ������ ��� ��
	 * @param pvo
	 * @param model
	 * @return
	 ************************************************************/
	@RequestMapping(value="/product/productDetail.do", method=RequestMethod.GET)
	public String productDetail(AdminProductVO pvo, Model model) {
		logger.info("adminProductDetail ȣ�� ����");
		logger.info("p_code = " + pvo.getP_code());

		AdminProductVO detail = new AdminProductVO();
		detail = adminProductService.productDetail(pvo);

		List<AdminImageVO> imageList = adminProductService.productDetailImage(pvo);	
		model.addAttribute("imageList", imageList);
		
		
		if(detail != null && (!detail.equals(""))) {
			detail.setP_content(detail.getP_content().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);
		return "admin/product/productDetail";
	}

	/*****************************************************************
	 * �� ���� ��
	 *****************************************************************/
	@RequestMapping(value="/product/deleteForm.do")
	public String ProductDelete(AdminProductVO pvo, HttpServletRequest request) throws IOException {
		logger.info("adminProductDelete ȣ�� ����");

		int result = 0;
		String url = "";

		if(!pvo.getImg_image().isEmpty()) {
			FileUploadUtil.fileDelete(pvo.getImg_image(), request);
		}

		result = adminProductService.productDelete(pvo);

		if(result == 1) {
			url = "/admin/product/productList.do";
		} else {
			url = "/admin/product/productDetail.do?p_code="+pvo.getP_code();
		}

		return "redirect:"+url;
	}
}