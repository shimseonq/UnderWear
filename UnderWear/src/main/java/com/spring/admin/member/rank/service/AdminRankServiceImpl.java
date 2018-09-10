
package com.spring.admin.member.rank.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.member.controller.AdminMemberController;
import com.spring.admin.member.dao.AdminMemberDao;
import com.spring.admin.member.rank.dao.AdminRankDao;
import com.spring.client.member.rank.dao.RankDao;
import com.spring.client.member.rank.vo.RankVO;
import com.spring.client.member.vo.MemberVO;
import com.spring.client.order.vo.OrderVO;

@Service
public class AdminRankServiceImpl implements AdminRankService{
	Logger logger = Logger.getLogger(AdminMemberController.class);
	@Autowired
	private RankDao rankDao;
	@Autowired
	private AdminRankDao adminRankDao;
	@Autowired
	private AdminMemberDao adminMemberDao;
	
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

	@Override
	public int rankPaysUpdate(MemberVO mvo, String[] c_num) {
			logger.info("rankPaysUpdate »£√‚"	);
			int c_no;
			int result=0;
			for(int i=0; i<c_num.length; i++) {
				MemberVO vo = new MemberVO();
				c_no = Integer.parseInt(c_num[i]);
				mvo.setC_num(c_no);
				vo = adminMemberDao.rankNo(mvo);
				int sumRank = vo.getRk_no();
				logger.info(vo.getRk_no());				
				if(sumRank ==1) {
					result = adminMemberDao.rankPayUpdate1(vo);
				}else if(sumRank==2) {
					result = adminMemberDao.rankPayUpdate2(vo);
				}else if(sumRank==3) {
					result = adminMemberDao.rankPayUpdate3(vo);
				}else
					logger.info(result);
			}
			
			return result;
		}



}
