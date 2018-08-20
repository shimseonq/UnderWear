package com.spring.client.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.product.dao.BigCategoryDao;
import com.spring.client.product.dao.PriceDao;
import com.spring.client.product.dao.ProductDao;
import com.spring.client.product.dao.SmallCategoryDao;
import com.spring.client.product.vo.BigCategoryVO;
import com.spring.client.product.vo.PriceVO;
import com.spring.client.product.vo.ProductVO;
import com.spring.client.product.vo.SmallCategoryVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao; //의존객체
	private PriceDao priceDao;
	private BigCategoryDao bigCategoryDao;
	private SmallCategoryDao smallCategoryDao;
	// 글목록 구현
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		List<ProductVO> myList = null;
		
		myList = productDao.productList(pvo);
		return myList;		
	}
	@Override
	public List<PriceVO> priceList(PriceVO prvo) {
		
		List<PriceVO> myList = null;
		
		myList = priceDao.priceList(prvo);
		return myList;
	}
	@Override
	public List<BigCategoryVO> bigCategoryList(BigCategoryVO bvo) {
		
		List<BigCategoryVO> myList = null;
		
		myList = bigCategoryDao.bigCategoryList(bvo);
		return myList;
	}
	@Override
	public List<SmallCategoryVO> smallCateList(SmallCategoryVO svo) {
		
		List<SmallCategoryVO> myList = null;
		
		myList = smallCategoryDao.smallCategoryList(svo);
		return myList;
	}
	
	//글입력 구현
	@Override
	public int productInsert(ProductVO pvo) {
		int result = 0;
		try {
			result = productDao.productInsert(pvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
}
