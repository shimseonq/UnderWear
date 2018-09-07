package com.spring.admin.image.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.admin.image.vo.AdminImageVO;
import com.spring.client.product.vo.ProductVO;

@Repository
public class AdminImageDaoImpl implements AdminImageDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<AdminImageVO> imageList(AdminImageVO ivo) {
		return session.selectList("imageList", ivo);
	}

	@Override
	public int imageInsert(AdminImageVO ivo) {
		return session.insert("imageInsert", ivo);
	}

/*	@Override
	public int getImageSeq() {
		return (Integer)session.selectOne("getImageSeq");
	}

	@Override
	public String getMain(int img_no) {
		return session.selectOne("getMain", img_no);
	}*/

	@Override
	public int imageMainUpdate(AdminImageVO ivo) {
		return session.update("imageMainUpdate", ivo);
	}

	@Override
	public AdminImageVO imageDetail(AdminImageVO ivo) {
		return session.selectOne("imageDetail", ivo);
	}

	@Override
	public int imageUpdate(AdminImageVO ivo) {
		return session.update("imageUpdate", ivo);
	}

	@Override
	public int imageDelete(AdminImageVO ivo) {
		return session.delete("imageDelete", ivo);
	}

	@Override
	public List<AdminImageVO> imageName() {
		return session.selectList("imageName");
	}

	@Override
	public List<AdminImageVO> imageList(ProductVO ivo) {
		return session.selectList("imageList",ivo);
	}

}
