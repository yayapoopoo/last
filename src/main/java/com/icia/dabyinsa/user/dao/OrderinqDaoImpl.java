package com.icia.dabyinsa.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.dabyinsa.user.dto.OrderinqDto;

@Repository
public class OrderinqDaoImpl implements OrderinqDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<OrderinqDto> oiqList(String m_id) {
		return sqlSession.selectList("oiqList", m_id);
	}

}
