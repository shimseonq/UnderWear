package com.spring.client.reviewReply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.client.reviewReply.service.ReviewReplyService;
import com.spring.client.reviewReply.vo.ReviewReplyVO;

@RestController
@RequestMapping(value = "/reviewReply")
public class ReviewReplyController {
	Logger logger = Logger.getLogger(ReviewReplyController.class);

	@Autowired
	private ReviewReplyService reviewReplyService;

	/*******************************************************************************
	 * ��� �� ��� �����ϱ�
	 * 
	 * @return List<ReviewReviewReplyVO> ����: @pathVariable�� URI �� ��ο��� ���ϴ� �����͸� �����ϴ�
	 *         �뵵�� ������̼�. ���� ��û URL : http://localhost:8080/reolies/all/�Խ��Ǳ۹�ȣ.do ����
	 *         ��û URL : http://localhost:8080/reolies/replyList.do ?b_num = �Խ��� �۹�ȣ
	 ********************************************************************************/
	@RequestMapping(value = "/all/{rv_no}.do", method = RequestMethod.GET)
	public ResponseEntity<List<ReviewReplyVO>> list(@PathVariable("rv_no") Integer rv_no, HttpSession session,
			ReviewReplyVO qrvo) {
		ResponseEntity<List<ReviewReplyVO>> entity = null;
		/*
		 * LoginVO login =(LoginVO)session.getAttribute("login");
		 * logger.info("c_id = "+login.getC_id()); qrvo.setC_id(login.getC_id());
		 */
		try {
			entity = new ResponseEntity<>(reviewReplyService.reviewReplyList(rv_no), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/***********************************************************************************
	 * ��� �۾��� �����ϱ�
	 * 
	 * @return String ���� : @RequestBody
	 ************************************************************************************/

	@RequestMapping(value = "/replyInsert.do")
	public ResponseEntity<String> replyInsert(@RequestBody ReviewReplyVO rvo) { // @RequestBody json �޾ƿ����� vo�� ��� ����
		logger.info("replyInsert ȣ�� ���� !");
		ResponseEntity<String> entity = null;
		int result;

		try {
			result = reviewReplyService.replyInsert(rvo);
			if (result == 1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;

	}

	/***********************************************************************************
	 * ��� ����,���� �� ��й�ȣ üũ
	 * @return String ���� : @RequestBody
	 ************************************************************************************/

	@RequestMapping(value = "/replyPwdCheck.do")
	public ResponseEntity<Integer> pwdCheck(ReviewReplyVO rvo) {
		logger.info("PwdCheck ȣ�� ����");
		ResponseEntity<Integer> entity = null;
		int result = 0;
		try {
			result = reviewReplyService.pwdCheck(rvo);
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/***********************************************************************************
	 * ��� ���� �����ϱ�
	 * 
	 * @return ���� : REST ��� ���� EELETE �۾��� DELETE����� �̿��ؼ� ó��.
	 ************************************************************************************/

	@RequestMapping(value = "/{rrp_no}.do", method = RequestMethod.DELETE)
	public ResponseEntity<String> replyDelete(@PathVariable("rrp_no") Integer rrp_no) {
		logger.info("replyDelete ȣ�� ����");
		ResponseEntity<String> entity = null;
		try {
			reviewReplyService.replyDelete(rrp_no);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;

	}

	/***********************************************************************************
	 * ��� ���������ϱ�
	 * @return
	 ************************************************************************************/

	@RequestMapping(value = "/{rrp_no}.do", method = RequestMethod.PUT)
	public ResponseEntity<String> replyUpdate(@PathVariable("rrp_no") Integer rrp_no, @RequestBody ReviewReplyVO rvo) {
		logger.info("replyUpdate ȣ�� ����");
		ResponseEntity<String> entity = null;

		try {
			rvo.setRrp_no(rrp_no);
			reviewReplyService.replyUpdate(rvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}


}
