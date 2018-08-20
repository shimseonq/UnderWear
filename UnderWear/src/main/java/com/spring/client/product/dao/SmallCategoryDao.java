package com.spring.client.product.dao;

import java.util.List;

import com.spring.client.product.vo.SmallCategoryVO;

public interface SmallCategoryDao {
	public List<SmallCategoryVO> smallCategoryList(SmallCategoryVO svo);
}
