package com.spring.client.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.product.vo.SmallCategoryVO;

@Repository
public class SmallCategoryDaoImpl implements SmallCategoryDao {
	
	@Autowired
	private SqlSession session;
	
	public List<SmallCategoryVO> smallCategoryList(SmallCategoryVO svo) {
		return session.selectList("smallCategoryList", svo);
	}

}
