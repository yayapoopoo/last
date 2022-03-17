package com.icia.dabyinsa.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.dabyinsa.user.dao.MainDao;
import com.icia.dabyinsa.user.dto.BoardEventDto;
import com.icia.dabyinsa.user.dto.MemberDto;
import com.icia.dabyinsa.user.dto.ProductListDto;

@Service
public class MainService {

	@Autowired
	private MainDao mDao;
	

	// NEW ITEMS 상품 목록 출력 (등록일자 오름차순)
	public List<ProductListDto> getMainNPList() {
		return mDao.getMNPList();
	}

	// BEST ITEMS 상품 목록 출력 (등록일자 오름차순)
	public List<ProductListDto> getMainBPList() {
		return mDao.getMBPList();
	}
	
	// BEST ITEMS 상품별 후기 개수 출력
	public int getMainBPcnt(String prod_id)  {
		return mDao.getMBPcnt(prod_id);
	}
	
	// EVENTS 상품 목록 출력 (등록일자 오름차순)
	public List<BoardEventDto> getMainBEList() {
		return mDao.getMBEList();
	}
	
	// 상품 상세페이지 이동
	public List<ProductListDto> getproddetailList() {
		return mDao.getdetailList();
	}
	
	

}

