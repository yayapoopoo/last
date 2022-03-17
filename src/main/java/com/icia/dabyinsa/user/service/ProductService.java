package com.icia.dabyinsa.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.dabyinsa.user.dao.ProductDao;
import com.icia.dabyinsa.user.dto.ProductListDto;
import com.icia.dabyinsa.user.dto.BoardQnaDto;
import com.icia.dabyinsa.user.dto.BoardReviewDto;

@Service
public class ProductService {

	@Autowired
	private ProductDao pDao;
	
	// 상품 목록 (전체 + 검색)
	public List<ProductListDto> getProductList(String keyword) {
		return pDao.getpList(keyword);
	}
	

	// 상품 개수 (전체 + 검색)
	public int getProductcnt(String keyword)  {
		return pDao.getProductcnt(keyword);
	}	

	

	// 상품 상세 페이지 이동
	public List<ProductListDto> getproddetailList() {
		return pDao.getdetailList();
	}
	
	public String getimg(String prod_id) {
	return pDao.getcookie(prod_id);
	}
	
	
	
	//상품 문의 / 후기 게시판 출력
	public List<BoardReviewDto> getreviewList(String prod_id) {
		return pDao.getreviewList(prod_id);
	}
	public List<BoardQnaDto> getqnaList(String prod_id) {
		return pDao.getqnaList(prod_id);
	}


}