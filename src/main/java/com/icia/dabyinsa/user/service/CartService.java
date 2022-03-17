package com.icia.dabyinsa.user.service;

import java.util.List;

import com.icia.dabyinsa.user.dto.CartDto;

public interface CartService {
	
	List<CartDto> cart_money();
	
	void insert(CartDto dto);
	
	List<CartDto> list(String m_id);
	
	void delete(int cart_id);
	
	void delete_all(String m_id);
	
	int sum_money(String m_id);
	
	void update(CartDto dto);
}
