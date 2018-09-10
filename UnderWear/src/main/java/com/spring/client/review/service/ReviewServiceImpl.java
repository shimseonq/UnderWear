package com.spring.client.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.review.dao.ReviewDao;
import com.spring.client.review.vo.ReviewVO;
import com.spring.client.reviewReply.dao.ReviewReplyDao;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private ReviewReplyDao reviewReplyDao;
	/*********************
	 * 글목록 구현
	 *********************/
	@Override
	public List<ReviewVO> reviewList(ReviewVO rvo) {
		List<ReviewVO> rList = null;
		if(rvo.getSearch()=="") {
			rvo.setSearch("all");
		}
		rList = reviewDao.reviewList(rvo);
		return rList;
	}
	
	/*********************
	 * 글  상세보기 구현 하는 부분
	 *********************/
	@Override
	public ReviewVO reviewDetail(ReviewVO rvo) {
		ReviewVO detail = null;
		reviewDao.reviewHitUpdate(rvo.getRv_no());
		detail = reviewDao.reviewDetail(rvo);
		return detail;
	}
	// 글 수정 구현
	@Override
	public int reviewUpdate(ReviewVO rvo) {
		int result = 0;
		try {
			result = reviewDao.reviewUpdate(rvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	// 비밀번호 확인 구현
	@Override
	public int pwdConfirm(ReviewVO rvo) {
		int result = 0;
		result = reviewDao.pwdConfirm(rvo);
		return result;
	}

	@Override
	public int reviewInsert(ReviewVO rvo) {
		int result = 0;
		try {
			result = reviewDao.reviewInsert(rvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int reviewDelete(ReviewVO rvo) {
		int result = 0;
		try {
			result = reviewDao.reviewDelete(rvo);
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int replyCount(int rv_no) {
		int result = reviewReplyDao.replyCount(rv_no);
	      return result;
	}



}
	