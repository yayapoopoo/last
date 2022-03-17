package com.icia.dabyinsa.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.icia.dabyinsa.user.dto.CartDto;

@Mapper
public interface CartDao {
	
	List<CartDto> cart_money();
	
	void cinsert(CartDto dto);
	
	List<CartDto> list(String m_id);
	
	void delete(int cart_id);
	
	void delete_all(String m_id);
	
	int sum_money(String m_id);
	
	void update(CartDto dto);
	
	void cainsert(CartDto dto);
	
	void orderInsert(CartDto dto);
	
}
