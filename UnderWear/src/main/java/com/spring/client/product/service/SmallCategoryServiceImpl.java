package com.spring.client.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.client.product.dao.SmallCategoryDao;
import com.spring.client.product.vo.SmallCategoryVO;

public class SmallCategoryServiceImpl implements SmallCategoryService{

	
		@Autowired
		private SmallCategoryDao smallCategoryDao; 
		
		@Override
		public List<SmallCategoryVO> smallCategoryList(SmallCategoryVO svo) {
			List<SmallCategoryVO> myList = null;
			
			myList = smallCategoryDao.smallCategoryList(svo);
			return myList;
	}
	}
	

