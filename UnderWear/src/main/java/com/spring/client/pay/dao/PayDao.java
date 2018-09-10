package com.spring.client.pay.dao;

import java.util.List;

import com.spring.client.pay.vo.PayVO;
import com.spring.client.sale.vo.SaleVO;

public interface PayDao {
	
	public int payNumber();

	public int payInsert(SaleVO svo);

	public List<PayVO> payList(PayVO pvo);

}
