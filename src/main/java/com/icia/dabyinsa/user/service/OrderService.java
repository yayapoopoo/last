package com.icia.dabyinsa.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.icia.dabyinsa.user.dao.OrderDao;
import com.icia.dabyinsa.user.dto.MemberDto;
import com.icia.dabyinsa.user.dto.OrderDto;
import com.icia.dabyinsa.user.dto.ProductListDto;
import com.icia.dabyinsa.user.dto.CartDto;
import com.icia.dabyinsa.user.dto.CouponDto;

@Service
public class OrderService {
	

	@Autowired
	private OrderDao oDao;

	
	
	// 회원 정보 목록
	public MemberDto getmemberInfoList(String mid) {
		return oDao.getmInfoList(mid);
	}

	
	// 주문 페이지 이동
	public List<ProductListDto> getorderList() {
		return oDao.getoList();
	}
	
	
	

	// 주문 저장 (데이터베이스이동)
	public String OrderInsert (OrderDto odto) {
		
		String view = null;
		oDao.OrderInsert(odto);
		view = "redirect:/";
		return view;
	}
	
		public String OrderInsert2 (OrderDto odto) {
			
			String view2 = null;
			oDao.OrderInsert2(odto);
			view2 = "redirect:/";
			return view2;
		}
	
		public String OrderInsert3 (OrderDto odto) {
			
			String view3 = null;
			oDao.OrderInsert3(odto);
			view3 = "redirect:/";
			return view3;
		}
	
		
	// 저장한 주문 불러오기
	public OrderDto OrderdInfo(String o_code,String m_id, String prod_id) {
		return oDao.OrderdInfo(o_code,m_id,prod_id);
	}

	// 회원의 쿠폰정보 불러오기
	public List<CouponDto> couponList(String mid) {
		return oDao.getcouponList(mid);
	}
	
	
	
	



	


	
}
	


