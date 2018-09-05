package com.spring.admin.image.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.admin.image.vo.ImageVO;

@Repository
public class ImageDaoImpl implements ImageDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ImageVO> imageList(ImageVO ivo) {
		return session.selectList("imageList", ivo);
	}

	@Override
	public int imageInsert(ImageVO ivo) {
		return session.insert("imageInsert", ivo);
	}

	@Override
	public int getImageSeq() {
		return (Integer)session.selectOne("getImageSeq");
	}

	@Override
	public String getMain(int img_no) {
		return session.selectOne("getMain", img_no);
	}

	@Override
	public int imageMainUpdate(ImageVO ivo) {
		return session.update("imageMainUpdate", ivo);
	}

	@Override
	public ImageVO imageDetail(ImageVO ivo) {
		return session.selectOne("imageDetail", ivo);
	}

	@Override
	public int imageUpdate(ImageVO ivo) {
		return session.update("imageUpdate", ivo);
	}

	@Override
	public int imageDelete(ImageVO ivo) {
		return session.delete("imageDelete", ivo);
	}

	@Override
	public List<ImageVO> imageName() {
		return session.selectList("imageName");
	}

}
