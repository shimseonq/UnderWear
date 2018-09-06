package com.spring.client.reviewReply.service;

import java.util.List;

import com.spring.client.reviewReply.vo.ReviewReplyVO;

public interface ReviewReplyService {

	public List<ReviewReplyVO> reviewReplyList(Integer rv_no);

	public int replyInsert(ReviewReplyVO rvo);

	public int pwdCheck(ReviewReplyVO rvo);

	public int replyDelete(Integer rrp_no);

	public int replyUpdate(ReviewReplyVO rvo);
	
	public int replyCount(int rv_no);
}
