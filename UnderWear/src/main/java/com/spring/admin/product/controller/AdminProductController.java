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

	@Autowired	//의존성 주입
	private AdminProductService adminProductService;

	@Autowired
	private AdminImageService adminImageService;
	
	@Autowired
	private ProductService productService;

	/*글목록 구현하기 (페이징 처리를 제외한 목록)*/

	@RequestMapping(value="/product/productList.do", method = RequestMethod.GET)
	public String productList(@ModelAttribute ("data")AdminProductVO pvo, Model model) {
		logger.info("adminProductList 호출 성공");

		List<AdminProductVO> productList = adminProductService.productList(pvo);	
		//System.out.println(productList.toString());
		model.addAttribute("productList", productList);

		return "admin/product/productList";
	}


	/*****************************************************************************************
	 * 글쓰기 구현하기(첨부파일을 포함한 입력작업)
	 *****************************************************************************************/
	@RequestMapping(value="/product/productInsert.do", method=RequestMethod.POST)
	public String productInsert(AdminProductVO pvo, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("adminProductInsert 호출 성공");

		/*// 확인 후 주석 처리
		logger.info("fileName : " + pvo.getFiles().getOriginalFilename());
		logger.info("p_name : " + pvo.getP_name());*/

		// 오류발생 제어가 필요할 시에 사용
		int result = 0;
		String url = "";


		result = adminProductService.productInsert(pvo, request);


		if (result == 1) {
			url = "/admin/product/productList.do";	//insert시 문제가 없으면 redirect 함. 정상처리.
		} else {
			model.addAttribute("code", 1);	// 오류가 발생한 경우는 code값이 1
			url = "/admin/product/writeForm.do";
		}

		return "redirect:"+url;		// if와 redirect가 겹치면 넘어가지 않는다.0
	}



	/***************************************************************
	 *  글 쓰기 폼 출력하기
	 ***************************************************************/
	@RequestMapping(value="/product/writeForm.do")
	public String writeForm() {
		logger.info("adminWriteForm 호출 성공");

		return "admin/product/writeForm";
	}

	/***************************************************************
	 *  글 수정 폼 출력하기
	 ***************************************************************/
	@RequestMapping(value="/product/updateForm.do")
	public String updateForm(AdminProductVO pvo ,Model model) {
		logger.info("adminUpdateForm 호출 성공");
		
		logger.info("p_code = " + pvo.getP_code());
		
		AdminProductVO updateData = new AdminProductVO();
		updateData = adminProductService.productDetail(pvo);
		
		List<AdminImageVO> imageUpdate = adminProductService.imageUpdate(pvo);	
		model.addAttribute("imageUpdate", imageUpdate);

		model.addAttribute("updateData", updateData);

		return "admin/product/updateForm";
	}


	/****************************************************************
	 * genderdep : 카테고리 반환
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
	 * 글 수정 
	 ******************************************************************/
	@RequestMapping(value="/product/productUpdate.do", method=RequestMethod.POST, produces = "text/plain; carset=UTF-8")
	public String productUpdate(AdminProductVO pvo, Model model, HttpServletRequest request) throws IOException {
		logger.info("adminProductUpdate 호출 성공");

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
	 * 상세 페이지 출력 폼
	 * @param pvo
	 * @param model
	 * @return
	 ************************************************************/
	@RequestMapping(value="/product/productDetail.do", method=RequestMethod.GET)
	public String productDetail(AdminProductVO pvo, Model model) {
		logger.info("adminProductDetail 호출 성공");
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
	 * 글 삭제 폼
	 *****************************************************************/
	@RequestMapping(value="/product/deleteForm.do")
	public String ProductDelete(AdminProductVO pvo, HttpServletRequest request) throws IOException {
		logger.info("adminProductDelete 호출 성공");

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