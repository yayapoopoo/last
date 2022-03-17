package com.icia.dabyinsa.user.dao;

import java.util.List;

import com.icia.dabyinsa.user.dto.WishDto;

public interface WishDao {
	
	List<WishDto> wishList(String m_id);
	
	void wishDelete(int w_id);
	
	void wishDelete_all(String m_id);

	void wishInsert(WishDto dto);

}
