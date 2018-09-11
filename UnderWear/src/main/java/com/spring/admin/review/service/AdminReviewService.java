package com.spring.admin.review.service;

import java.util.List;

import com.spring.client.review.vo.ReviewVO;

public interface AdminReviewService {

	public List<ReviewVO> reviewList(ReviewVO rvo);

	public ReviewVO reviewDetail(ReviewVO rvo);

	public int reviewDelete(ReviewVO rvo);

	public int replyCount(int rv_no);
}
