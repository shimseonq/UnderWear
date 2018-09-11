package com.spring.admin.review.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.review.dao.ReviewDao;
import com.spring.client.review.vo.ReviewVO;

@Service
public class AdminReviewServiceImpl implements AdminReviewService {

	Logger logger = Logger.getLogger(AdminReviewServiceImpl.class);
	
	@Autowired
	private ReviewDao reviewDao;

	@Override
	public List<ReviewVO> reviewList(ReviewVO rvo) {
		List<ReviewVO> rList = null;
		
		rList = reviewDao.reviewList(rvo);
		return rList;
	}

	@Override
	public ReviewVO reviewDetail(ReviewVO rvo) {
		ReviewVO detail = null;
		reviewDao.reviewHitUpdate(rvo.getRv_no());
	      detail = reviewDao.reviewDetail(rvo);
	      
	      return detail;
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



	}
