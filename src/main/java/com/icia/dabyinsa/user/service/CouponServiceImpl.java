package com.icia.dabyinsa.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.dabyinsa.user.dao.CouponDao;
import com.icia.dabyinsa.user.dto.CouponDto;

@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	CouponDao cpDao;
	
	@Override
	public void cpInsert(CouponDto dto) {
		cpDao.cpInsert(dto);
	}

}
