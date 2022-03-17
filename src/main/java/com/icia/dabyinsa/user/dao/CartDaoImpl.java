package com.icia.dabyinsa.user.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.dabyinsa.user.dto.CartDto;

@Repository
public class CartDaoImpl implements CartDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<CartDto> cart_money() {
		return sqlSession.selectList("cart_money");
	}

	@Override
	public void cinsert(CartDto dto) {
		sqlSession.insert("insert", dto);

	}

	@Override
	public List<CartDto> list(String m_id) {
		return sqlSession.selectList("list", m_id);
	}

	@Override
	public void delete(int cart_id) {
		sqlSession.delete("delete", cart_id);
	}

	@Override
	public void delete_all(String m_id) {
		sqlSession.delete("delete_all", m_id);
	}

	@Override
	public int sum_money(String m_id) {
		return sqlSession.selectOne("sum_money", m_id);
	}

	@Override
	public void update(CartDto dto) {
		sqlSession.update("update", dto);
	}

	@Override
	public void cainsert(CartDto dto) {
		sqlSession.insert("cainsert", dto);
		
	}
	
	@Override
	public void orderInsert(CartDto dto) {
		sqlSession.insert("orderInsert", dto);
		
	}



}
