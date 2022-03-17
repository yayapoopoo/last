package com.icia.dabyinsa.user.dao;

import java.util.List;

import com.icia.dabyinsa.user.dto.MiligeDto;

public interface MiligeDao {
	
		List<MiligeDto> miList(String m_id);

}
