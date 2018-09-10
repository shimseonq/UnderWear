
package com.spring.admin.member.rank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.member.rank.dao.RankDao;
import com.spring.client.member.rank.vo.RankVO;
import com.spring.client.member.vo.MemberVO;

@Service
public class AdminRankServiceImpl implements AdminRankService{
	@Autowired
	private RankDao rankDao;
	
	@Override
	public List<RankVO> rankList(RankVO rvo) {
		List<RankVO> rList=null;
		rList = rankDao.rankList(rvo);
		return rList;
	}

	@Override
	public String myRank(RankVO rvo) {
		String myRank = null;
		myRank = rankDao.myRank(rvo);
		return myRank;
	}


}
