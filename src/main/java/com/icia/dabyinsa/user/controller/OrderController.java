package com.icia.dabyinsa.user.controller;


import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.icia.dabyinsa.user.dto.MemberDto;
import com.icia.dabyinsa.user.dto.OrderDto;
import com.icia.dabyinsa.user.dto.ProductListDto;
import com.icia.dabyinsa.user.dao.OrderDao;
import com.icia.dabyinsa.user.dto.CartDto;
import com.icia.dabyinsa.user.dto.CouponDto;
import com.icia.dabyinsa.user.service.OrderService;



@Controller
@RequestMapping("user")
public class OrderController {	

	@Autowired
	private OrderService oserv;


	// 주문 페이지 이동
	@Secured("ROLE_USER")
	@GetMapping("order/{id}")
	public String order(@PathVariable("id") String prod_id, Model model, Principal p, String p_num1, OrderDto odto) {
		
		Map<String, Object> map=new HashMap<>();
		String id= p.getName(); //스프링 시큐리티에서 id값을 받아옴
		// 로그인이 되어있으면 주문페이지, 아니면 로그인 페이지로 이동
		if(id!=null) {
			model.addAttribute("id" , prod_id );
			List<ProductListDto> oList = oserv.getorderList();
			MemberDto mList = oserv.getmemberInfoList(id);
			List<CouponDto> cList = oserv.couponList(id);

			
			String email= mList.m_email;
	        int idx = email.indexOf("@"); 
	        // 앞부분 추출
			String fresult = email.substring(0,idx);
			// 뒷부분 추출
			String eresult = email.substring(idx+1);
			
			map.put("fresult", fresult);
			map.put("eresult", eresult);
			map.put("p_num1", p_num1);
			map.put("cList", cList);
			map.put("oList", oList);
			map.put("mList", mList);
			
			model.addAttribute("omap", map);
			
			return "user/order";
		}

		else {
			return "user/loginForm";

		} 
	}
	
	

	@GetMapping("pay")
	public String OrderInsert(OrderDto odto, Model model, String o_code,String m_id, String prod_id ) {


		String view = oserv.OrderInsert(odto);
		String view2 = oserv.OrderInsert2(odto);
		String view3 = oserv.OrderInsert3(odto);
		OrderDto oList = oserv.OrderdInfo(o_code,m_id,prod_id);


		model.addAttribute("o_code", o_code);
		model.addAttribute("view", view);
		model.addAttribute("view2", view2);
		model.addAttribute("view3", view3);
		model.addAttribute("oList", oList);

		return "user/pay"; 


	}
	
	

}

