package com.spring.client.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.product.dao.BigCategoryDao;
import com.spring.client.product.vo.BigCategoryVO;
@Service
public class BigCategoryServiceImpl implements BigCategoryService {
	
	@Autowired
	private BigCategoryDao bigCategoryDao; 
	
	@Override
	public List<BigCategoryVO> bigCategoryList(BigCategoryVO bvo) {
		List<BigCategoryVO> myList = null;
		
		myList = bigCategoryDao.bigCategoryList(bvo);
		return myList;
	}

}
