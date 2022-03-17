package com.icia.dabyinsa.user.dao;

import java.util.List;

import com.icia.dabyinsa.user.dto.CouponDto;

public interface CouponDao {
	
	void cpInsert(CouponDto dto);
	
	List<CouponDto> cpList(String m_id);

}
