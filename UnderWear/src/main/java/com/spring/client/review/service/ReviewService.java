package com.spring.client.review.service;

import java.util.List;

import com.spring.client.qna.vo.QnaVO;
import com.spring.client.review.vo.ReviewVO;

public interface ReviewService {

	public List<ReviewVO> reviewList(ReviewVO rvo);

	public ReviewVO reviewDetail(ReviewVO rvo);

	public int reviewUpdate(ReviewVO rvo);

	/*public int pwdConfirm(ReviewVO rvo);*/

	public int reviewInsert(ReviewVO rvo);

	public int reviewDelete(ReviewVO rvo);

	public int replyCount(int rv_no);
	
}
