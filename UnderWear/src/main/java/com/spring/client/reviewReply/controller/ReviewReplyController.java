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
	 * 댓글 글 목록 구현하기
	 * 
	 * @return List<ReviewReviewReplyVO> 참고: @pathVariable은 URI 의 경로에서 원하는 데이터를 추출하는
	 *         용도의 어노테이션. 현재 요청 URL : http://localhost:8080/reolies/all/게시판글번호.do 예전
	 *         요청 URL : http://localhost:8080/reolies/replyList.do ?b_num = 게시판 글번호
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
	 * 댓글 글쓰기 구현하기
	 * 
	 * @return String 참고 : @RequestBody
	 ************************************************************************************/

	@RequestMapping(value = "/replyInsert.do")
	public ResponseEntity<String> replyInsert(@RequestBody ReviewReplyVO rvo) { // @RequestBody json 받아왓을때 vo에 담기 위한
		logger.info("replyInsert 호출 성공 !");
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
	 * 댓글 수정,삭제 시 비밀번호 체크
	 * @return String 참고 : @RequestBody
	 ************************************************************************************/

	@RequestMapping(value = "/replyPwdCheck.do")
	public ResponseEntity<Integer> pwdCheck(ReviewReplyVO rvo) {
		logger.info("PwdCheck 호출 성공");
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
	 * 댓글 삭제 구현하기
	 * 
	 * @return 참고 : REST 방식 에서 EELETE 작업은 DELETE방식을 이용해서 처리.
	 ************************************************************************************/

	@RequestMapping(value = "/{rrp_no}.do", method = RequestMethod.DELETE)
	public ResponseEntity<String> replyDelete(@PathVariable("rrp_no") Integer rrp_no) {
		logger.info("replyDelete 호출 성공");
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
	 * 댓글 수정구현하기
	 * @return
	 ************************************************************************************/

	@RequestMapping(value = "/{rrp_no}.do", method = RequestMethod.PUT)
	public ResponseEntity<String> replyUpdate(@PathVariable("rrp_no") Integer rrp_no, @RequestBody ReviewReplyVO rvo) {
		logger.info("replyUpdate 호출 성공");
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
