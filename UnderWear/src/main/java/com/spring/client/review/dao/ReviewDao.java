package com.spring.client.review.dao;

import java.util.List;

import com.spring.client.review.vo.ReviewVO;

public interface ReviewDao {

	public List<ReviewVO> reviewList(ReviewVO rvo);

	public ReviewVO reviewDetail(ReviewVO rvo);

	public int reviewUpdate(ReviewVO rvo);


	public int reviewInsert(ReviewVO rvo);

	public int reviewDelete(ReviewVO rvo);

	public int reviewHitUpdate(int rv_no);

}
