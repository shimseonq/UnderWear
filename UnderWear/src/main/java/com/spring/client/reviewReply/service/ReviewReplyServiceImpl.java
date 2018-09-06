package com.spring.client.reviewReply.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.qnaReply.service.QnaReplyServiceImpl;
import com.spring.client.reviewReply.dao.ReviewReplyDao;
import com.spring.client.reviewReply.vo.ReviewReplyVO;
@Service
public class ReviewReplyServiceImpl implements ReviewReplyService {

Logger logger = Logger.getLogger(QnaReplyServiceImpl.class);
	
	@Autowired
	private ReviewReplyDao reviewReplyDao;
	
	@Override
	public List<ReviewReplyVO> reviewReplyList(Integer rv_no) {
		List<ReviewReplyVO> myList = null;
		myList = reviewReplyDao.reviewReplyList(rv_no);
		
		return myList;
	}

	@Override
	public int replyInsert(ReviewReplyVO rvo) {
		int result = 0;
		try {
			result = reviewReplyDao.replyInsert(rvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}


	@Override
	public int replyDelete(Integer rrp_no) {
		int result = 0;
		try {
			result = reviewReplyDao.replyDelete(rrp_no);
		} catch (Exception e) {
			e.printStackTrace();
			result=0;
		}
		return result;
		
	}

	@Override
	public int replyUpdate(ReviewReplyVO rvo) {
		int result=0;
		try {
			result = reviewReplyDao.replyUpdate(rvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
		
	}

	@Override
	public int pwdCheck(ReviewReplyVO rvo) {
		int result=0;
		result = reviewReplyDao.pwdCheck(rvo);
		return result;
	}

	@Override
	public int replyCount(int rv_no) {
		int result = reviewReplyDao.replyCount(rv_no);
	      return result;
	}
	
}

