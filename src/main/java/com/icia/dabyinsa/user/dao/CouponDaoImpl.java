package com.icia.dabyinsa.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.dabyinsa.user.dto.CouponDto;

@Repository
public class CouponDaoImpl implements CouponDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void cpInsert(CouponDto dto) {
		sqlSession.insert("cpInsert", dto);
	}
	
	@Override
	public List<CouponDto> cpList(String m_id){
		return sqlSession.selectList("cpList", m_id);
	}

}
