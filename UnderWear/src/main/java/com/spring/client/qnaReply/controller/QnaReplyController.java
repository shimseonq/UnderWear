package com.spring.client.qnaReply.controller;

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

import com.spring.client.login.vo.LoginVO;
import com.spring.client.qnaReply.service.QnaReplyService;
import com.spring.client.qnaReply.vo.QnaReplyVO;

@RestController
@RequestMapping(value="/qnaReply")
public class QnaReplyController {
Logger logger = Logger.getLogger(QnaReplyController.class);
	
	@Autowired
	private QnaReplyService qnaReplyService;

	/*******************************************************************************
	 * ��� �� ��� �����ϱ�
	 * @return List<qnaReplyVO>
	 * ����: @pathVariable�� URI �� ��ο��� ���ϴ� �����͸� �����ϴ� �뵵�� ������̼�.
	 * ���� ��û URL : http://localhost:8080/reolies/all/�Խ��Ǳ۹�ȣ.do
	 * ���� ��û URL : http://localhost:8080/reolies/replyList.do
	 * ?b_num =  �Խ��� �۹�ȣ
	 ********************************************************************************/
	@RequestMapping(value="/all/{q_no}.do", method = RequestMethod.GET)
	public ResponseEntity<List<QnaReplyVO>> list(@PathVariable("q_no")Integer q_no, HttpSession session, QnaReplyVO qrvo){
		ResponseEntity<List<QnaReplyVO>> entity = null;
		LoginVO login =(LoginVO)session.getAttribute("login");
	      logger.info("c_id = "+login.getC_id());
	      qrvo.setC_id(login.getC_id());
		try {
			entity = new ResponseEntity<>(qnaReplyService.qnaReplyList(q_no),HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/***********************************************************************************
	 * ��� �۾��� �����ϱ�
	 * @return String
	 * ���� : @RequestBody
	 ************************************************************************************/
	
	@RequestMapping(value="/qnaReplyInsert.do")
	public ResponseEntity<String> replyInsert(@RequestBody QnaReplyVO qrvo){	//@RequestBody json �޾ƿ����� vo�� ��� ���� 
		logger.info("replyInsert ȣ�� ���� !");
		ResponseEntity<String> entity = null;
		int result;
		
		try {
			result = qnaReplyService.qnaReplyInsert(qrvo);
			if(result==1) {
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
	/***********************************************************************************
	 * ��� ����,���� �� ��й�ȣ üũ
	 * @return String
	 * ���� : @RequestBody
	 ************************************************************************************/
	
	@RequestMapping(value="/qnaPwdCheck.do")
	public ResponseEntity<Integer> pwdCheck(QnaReplyVO qrvo){
		logger.info("PwdCheck ȣ�� ����") ;
		ResponseEntity<Integer> entity = null;
		int result = 0;
		try {
			result = qnaReplyService.pwdCheck(qrvo);
			entity = new ResponseEntity<Integer>(result,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(result,HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
