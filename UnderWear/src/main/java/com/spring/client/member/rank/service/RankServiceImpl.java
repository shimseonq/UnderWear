package com.spring.client.member.rank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.member.rank.dao.RankDao;
import com.spring.client.member.rank.vo.RankVO;

@Service
public class RankServiceImpl implements RankService {

	@Autowired
	private RankDao rankDao;
	
	@Override
	public List<RankVO> rankList(RankVO rvo) {
		List<RankVO> rList=null;
		rList = rankDao.rankList(rvo);
		return rList;
	}

}
