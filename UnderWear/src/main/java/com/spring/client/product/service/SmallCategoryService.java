package com.spring.client.product.service;

import java.util.List;

import com.spring.client.product.vo.SmallCategoryVO;

public interface SmallCategoryService {
	public List<SmallCategoryVO> smallCategoryList(SmallCategoryVO svo);
}
