package com.spring.client.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.review.vo.ReviewVO;
@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	@Autowired
	private SqlSession session;
	
	//리스트 구현
	@Override
	public List<ReviewVO> reviewList(ReviewVO rvo) {
		return session.selectList("reviewList",rvo);
	}
	//글 상세보기 구현
	@Override
	public ReviewVO reviewDetail(ReviewVO rvo) {
		return (ReviewVO)session.selectOne("reviewDetail", rvo);
	}
	
	@Override
	public int reviewUpdate(ReviewVO rvo) {
		return session.update("reviewDetail", rvo);
	}
	@Override
	public int pwdConfirm(ReviewVO rvo) {
		return (Integer)session.selectOne("pwdConfirm", rvo);
	}
	@Override
	public int reviewInsert(ReviewVO rvo) {
		return  session.insert("reviewInsert", rvo);
	}
	@Override
	public int reviewDelete(ReviewVO rvo) {
		return session.delete("reviewDelete",rvo);
	}

}
