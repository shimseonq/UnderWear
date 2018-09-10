package com.spring.client.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.admin.image.vo.AdminImageVO;
import com.spring.client.product.vo.ProductVO;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		return session.selectList("prodcutList", pvo);
	}
	//디테일공간
	@Override
	public ProductVO productDetail(ProductVO pvo) {
		return (ProductVO)session.selectOne("productDetail", pvo);
	}
	@Override
	public ProductVO productMain(ProductVO pvo) {
		return (ProductVO)session.selectOne("productMain", pvo);
	}
	
	@Override
	   public int inventoryCount(ProductVO pvo) {
	      return session.update("inventoryCount",pvo);
	   }
	
	
	
	@Override
	public int productDelete(ProductVO pvo) {
		return session.delete("productDelete",pvo);
	}
	
	@Override
	public int productUpdate(ProductVO pvo) {
		return session.update("productUpdate", pvo);
	}
	
	// 글 입력 구현.
	   @Override
	   public int productInsert(ProductVO pvo) {
	      return session.insert("productInsert", pvo);
	   }
	   
	   @Override
	   public List<ProductVO> bcategory() {
	      return session.selectList("category");
	   }
	   
	   @Override
	   public List<ProductVO> scategory() {
	      return session.selectList("category");
	   }
/*	@Override
	public int productInsert(ProductVO pvo) {
		return session.insert("productInsert", pvo);
	}*/
	   //썸네일공간
	@Override
	public List<ProductVO> productThumbnail(ProductVO pvo) {
		return session.selectList("productThumbnail", pvo);
	}
	
	
	
	
		//배열이미지 처리공간
	@Override
	public List<AdminImageVO> productDetailImage(ProductVO pvo) {
		return session.selectList("productDetailImage", pvo);
	}
	

	

	
}
