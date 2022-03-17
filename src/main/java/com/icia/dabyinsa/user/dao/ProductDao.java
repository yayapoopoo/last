package com.icia.dabyinsa.user.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.icia.dabyinsa.user.dto.ProductListDto;
import com.icia.dabyinsa.user.dto.BoardQnaDto;
import com.icia.dabyinsa.user.dto.BoardReviewDto;

@Mapper
public interface ProductDao {

	// 상품 목록 ( 전체 + 검색 )
	List<ProductListDto> getpList(String keyword);


	// 상품 개수 (전체 + 검색)
	int getProductcnt(String keyword);

	
	
	// 상품 상세 페이지 이동
	List<ProductListDto> getdetailList();
	
	// 쿠키
		String getcookie(String prod_id);
		
		
		
		
		
		//상품 문의 / 후기 게시판 출력
		List<BoardReviewDto> getreviewList(String prod_id);
		List<BoardQnaDto> getqnaList(String prod_id);
	
	
}