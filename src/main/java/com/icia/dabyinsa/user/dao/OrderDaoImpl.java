package com.icia.dabyinsa.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.icia.dabyinsa.user.dto.CouponDto;
import com.icia.dabyinsa.user.dto.MemberDto;
import com.icia.dabyinsa.user.dto.OrderDto;
import com.icia.dabyinsa.user.dto.ProductListDto;

public class OrderDaoImpl implements OrderDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ProductListDto> getoList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDto getmInfoList(String mid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void OrderInsert(OrderDto odto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void OrderInsert2(OrderDto odto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void OrderInsert3(OrderDto odto) {
		// TODO Auto-generated method stub

	}

	@Override
	public OrderDto OrderdInfo(String o_code, String m_id, String prod_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CouponDto> getcouponList(String mid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void orderInsert(OrderDto c) {
		sqlSession.insert("orderInsert", c);
	}

}
