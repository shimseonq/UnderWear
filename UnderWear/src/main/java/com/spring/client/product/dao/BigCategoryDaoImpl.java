package com.spring.client.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.product.vo.BigCategoryVO;

@Repository
public class BigCategoryDaoImpl implements BigCategoryDao {
	
	@Autowired
	private SqlSession session;
	
	public List<BigCategoryVO> bigCategoryList(BigCategoryVO bvo) {
		return session.selectList("bigCategoryList", bvo);
	}

}
