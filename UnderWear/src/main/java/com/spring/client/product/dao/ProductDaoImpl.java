package com.spring.client.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.product.vo.BigCategoryVO;
import com.spring.client.product.vo.PriceVO;
import com.spring.client.product.vo.ProductVO;
import com.spring.client.product.vo.SmallCategoryVO;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		return session.selectList("prodcutList", pvo);
	}

	@Override
	public List<PriceVO> priceList(PriceVO prvo) {
		return session.selectList("priceList", prvo);
	}

	@Override
	public List<BigCategoryVO> bigCategoryList(BigCategoryVO bvo) {
		return session.selectList("bigCategoryList",bvo);
	}

	@Override
	public List<SmallCategoryVO> smallCateList(SmallCategoryVO svo) {
		return session.selectList("smallCategoryList",svo);
	}
	
	@Override
	public int productInsert(ProductVO pvo) {
		return session.insert("productInsert", pvo);
	}
}
