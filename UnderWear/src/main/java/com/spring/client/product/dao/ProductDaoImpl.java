package com.spring.client.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.product.vo.ProductVO;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		return session.selectList("prodcutList", pvo);
	}
	
	// 글 입력 구현.
	@Override
	public int productInsert(ProductVO pvo) {
		return session.insert("productInsert", pvo);
	}

	@Override
	public ProductVO productDetail(ProductVO pvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int productUpdate(ProductVO pvo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
