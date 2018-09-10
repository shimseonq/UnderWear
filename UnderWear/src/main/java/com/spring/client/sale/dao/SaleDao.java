package com.spring.client.sale.dao;

import java.util.List;

import com.spring.client.sale.vo.SaleVO;

public interface SaleDao {

	public int saleInsert(SaleVO svo);

	public List<SaleVO> adminSaleList(SaleVO svo);

}
