package com.spring.admin.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.admin.image.vo.AdminImageVO;
import com.spring.admin.product.vo.AdminProductVO;

@Repository
public class AdminProductDaoImpl implements AdminProductDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<AdminProductVO> productList(AdminProductVO pvo) {
		return session.selectList("productList", pvo);
	}
	
	// 글 입력 구현.
	@Override
	public int productInsert(AdminProductVO pvo) {
		return session.insert("productInsert", pvo);
	}

	@Override
	public AdminProductVO productDetail(AdminProductVO pvo) {
		return (AdminProductVO)session.selectOne("productDetail", pvo);
	}

	@Override
	public int productUpdate(AdminProductVO pvo) {
		return session.update("productUpdate", pvo);
	}

	@Override
	public List<AdminProductVO> bcategory() {
		return session.selectList("category");
	}
	
	@Override
	public List<AdminProductVO> scategory() {		/*int bigct_no*/
		return session.selectList("category");		/*,bigct_no*/
	}

	@Override
	public int imageInsert(AdminImageVO pvo) {
		return session.insert("imageInsert", pvo);
	}

	@Override
	public List<AdminProductVO> imageList(AdminProductVO pvo) {
		return session.selectList("imageList", pvo);
	}


	@Override
	public int productNumber() {
		return (Integer)session.selectOne("productNumber");
	}

	@Override
	public List<AdminImageVO> productDetailImage(AdminProductVO pvo) {
		return session.selectList("productDetailImage", pvo);
	}

	@Override
	public List<AdminImageVO> imageUpdate(AdminProductVO ivo) {
		return session.selectList("imageUpdate", ivo);
	}

}
