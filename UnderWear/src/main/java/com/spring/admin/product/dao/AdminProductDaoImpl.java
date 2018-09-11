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

	// 글 상세보기 구현
	@Override
	public AdminProductVO productDetail(AdminProductVO pvo) {
		return (AdminProductVO)session.selectOne("productDetail", pvo);
	}

	// 글 수정 구현
	@Override
	public int productUpdate(AdminProductVO pvo) {
		return session.update("productUpdate", pvo);
	}

	// 대분류 구현
	@Override
	public List<AdminProductVO> bcategory() {
		return session.selectList("category");
	}
	
	// 소분류 구현
	@Override
	public List<AdminProductVO> scategory(int bigct_no) {		/*int bigct_no*/
		return session.selectList("category",bigct_no);		/*,bigct_no*/
	}

	// 이미지 입력 구현
	@Override
	public int imageInsert(AdminImageVO pvo) {
		return session.insert("imageInsert", pvo);
	}

	// 이미지 리스트 구현
	@Override
	public List<AdminProductVO> imageList(AdminProductVO pvo) {
		return session.selectList("imageList", pvo);
	}

	// 상품, 이미지의 시퀀스 생성
	@Override
	public int productNumber() {
		return (Integer)session.selectOne("productNumber");
	}

	// 이미지 상세보기 구현
	@Override
	public List<AdminImageVO> productDetailImage(AdminProductVO pvo) {
		return session.selectList("productDetailImage", pvo);
	}

	// 이미지 업데이트 구현
	@Override
	public int imageUpdate(AdminProductVO ivo) {
		return session.update("imageUpdate", ivo);
	}

	// 상품 정보 삭제
	@Override
	public int productDelete(AdminProductVO pvo) {
		return session.delete("productDelete", pvo);
	}

	// 상품 정보 이미지 삭제
	@Override
	public int imageDelete(AdminProductVO pvo) {
		return session.delete("imageDelete", pvo);
		
	}
	
	@Override
	public int statusUpdate(AdminProductVO pvo) {
		return session.update("statusUpdate", pvo);
	}

}
