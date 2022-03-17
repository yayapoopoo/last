package com.icia.dabyinsa.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.icia.dabyinsa.user.dto.MemberDto;
import com.icia.dabyinsa.user.dto.OrderDto;
import com.icia.dabyinsa.user.dto.ProductListDto;
import com.icia.dabyinsa.user.dto.CouponDto;


@Mapper
public interface OrderDao {
	
		// 상품 상세 페이지 이동
		List<ProductListDto> getoList();

		// 회원정보 가져오기
		MemberDto getmInfoList(String mid);
		
		
		// 주문 내역 데이터베이스에 저장
		void OrderInsert (OrderDto odto);
		void OrderInsert2 (OrderDto odto);
		void OrderInsert3 (OrderDto odto);
		

		// 저장한 주문 불러오기
		OrderDto OrderdInfo(String o_code,String m_id, String prod_id);
		
		// 회원의 쿠폰정보 불러오기
		List<CouponDto> getcouponList(String mid);

		void orderInsert(OrderDto c);
		


		
		

}
