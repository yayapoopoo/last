package com.icia.dabyinsa.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.dabyinsa.user.dto.WishDto;

@Repository
public class WishDaoImpl implements WishDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<WishDto> wishList(String m_id) {
		return sqlSession.selectList("wishList", m_id);
	}

	@Override
	public void wishDelete(int w_id) {
		sqlSession.delete("wishDelete", w_id);
	}

	@Override
	public void wishDelete_all(String m_id) {
		sqlSession.delete("wishDelete_all", m_id);
	}

	@Override
	public void wishInsert(WishDto dto) {
		sqlSession.insert("wishInsert", dto);
	}

}
