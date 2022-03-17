package com.icia.dabyinsa.admin.dao;

import java.util.List;
import java.util.Map;

import com.icia.dabyinsa.admin.dto.product.productlistDto;


import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductSearchDao {

    //상품 목록 검색 기능
    List<productlistDto> getPLList(String plkeyword, String plkeyword2, String plsearchOption, String plsearchOption2);
	int getPLListCount(String plkeyword, String plkeyword2, String plsearchOption, String plsearchOption2);
    
	
	//게시글 목록 가져오기
	List<productlistDto> getLLList(Map<String, Integer> plmap);
	
	//전체 글 개수 구하기
	int getpBoardCnt();
}
