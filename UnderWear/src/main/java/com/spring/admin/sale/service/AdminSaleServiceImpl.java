package com.spring.admin.sale.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.sale.dao.SaleDao;
import com.spring.client.sale.vo.SaleVO;

@Service
public class AdminSaleServiceImpl implements AdminSaleService {

	@Autowired
	private SaleDao saleDao;

	@Override
	public List<SaleVO> adminSaleList(SaleVO svo) {
		List<SaleVO> sList = null;
		sList = saleDao.adminSaleList(svo);
		return sList;
	}
	
	
}
