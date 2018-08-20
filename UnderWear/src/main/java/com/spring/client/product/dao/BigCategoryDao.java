package com.spring.client.product.dao;

import java.util.List;

import com.spring.client.product.vo.BigCategoryVO;

public interface BigCategoryDao {
	public List<BigCategoryVO> bigCategoryList(BigCategoryVO bvo);
}
