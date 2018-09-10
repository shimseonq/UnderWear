package com.spring.client.reviewReply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.reviewReply.vo.ReviewReplyVO;
@Repository
public class ReviewReplyDaoImpl implements ReviewReplyDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<ReviewReplyVO> reviewReplyList(Integer rv_no) {
		return session.selectList("reviewReplyList", rv_no);
	}

	@Override
	public int replyInsert(ReviewReplyVO rvo) {
		return session.insert("replyInsert",rvo);
	}

	@Override
	public int pwdCheck(ReviewReplyVO rvo) {
		return (Integer)session.selectOne("pwdCheck", rvo);
	}

	@Override
	public int replyDelete(Integer rrp_no) {
		return session.delete("replyDelete", rrp_no);
	}

	@Override
	public int replyUpdate(ReviewReplyVO rvo) {
		return session.update("replyUpdate", rvo);
	}

	@Override
	public int replyCount(int rv_no) {
		return session.selectOne("replyCount", rv_no);
	}

}
