package com.icia.dabyinsa.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.dabyinsa.user.dao.CartDao;
import com.icia.dabyinsa.user.dto.CartDto;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDao cartDao;
	
	@Override
	public List<CartDto> cart_money() {
		return null;
	}

	@Override
	public void insert(CartDto dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<CartDto> list(String m_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int cart_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete_all(String m_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public int sum_money(String m_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	@Override
	public void update(CartDto dto) {
		cartDao.update(dto);
	}

}
