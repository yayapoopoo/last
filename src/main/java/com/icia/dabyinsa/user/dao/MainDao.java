package com.icia.dabyinsa.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.icia.dabyinsa.user.dto.BoardEventDto;
import com.icia.dabyinsa.user.dto.MemberDto;
import com.icia.dabyinsa.user.dto.ProductListDto;

@Mapper
public interface MainDao {


	// NEW ITEMS 상품 목록 출력 (등록일자 오름차순)
	List<ProductListDto> getMNPList();
	
	// BEST ITEMS 상품 목록 출력 (등록일자 오름차순)
	List<ProductListDto> getMBPList();
	
	// BEST ITEMS 상품별 후기 개수 출력
	int getMBPcnt(String prod_id);

	// EVENTS 상품 목록 출력 (등록일자 오름차순)
	List<BoardEventDto> getMBEList();
	
	// 상품 상세페이지 이동
	List<ProductListDto> getdetailList();

 
}
