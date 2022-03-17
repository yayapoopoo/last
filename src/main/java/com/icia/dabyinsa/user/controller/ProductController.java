package com.icia.dabyinsa.user.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.icia.dabyinsa.user.dto.ProductListDto;
import com.icia.dabyinsa.user.dto.BoardQnaDto;
import com.icia.dabyinsa.user.dto.BoardReviewDto;
import com.icia.dabyinsa.user.service.ProductService;

@Controller
@RequestMapping("user")
public class ProductController {

	@Autowired
	private ProductService pserv;




	// 상품 목록 + 개수 ( 전체 + 검색 )
	@GetMapping("/product_list")
	public String Product_list(Model model, 
			@RequestParam(defaultValue = "") String keyword) {
		
		List<ProductListDto> pList = pserv.getProductList(keyword);
		
		int count = pserv.getProductcnt(keyword);


		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("pList", pList); // 상품목록
	
		map.put("count", count); // 상품개수

		model.addAttribute("map", map);
		return "user/product_list";
	}




	   // 상품 상세 페이지 이동 + 상품 쿠키
	   @GetMapping("/product/{id}")
	   public String product(@PathVariable("id") String prod_id, Model model, HttpServletResponse response) {
	      model.addAttribute("id" , prod_id );
	      List<ProductListDto> pList = pserv.getproddetailList();
	      List<BoardReviewDto> rbList = pserv.getreviewList(prod_id);
	      List<BoardQnaDto> qbList = pserv.getqnaList(prod_id);
	      model.addAttribute("pList", pList);
	      model.addAttribute("rbList", rbList);
	      model.addAttribute("qbList", qbList);
	      
	
	      String url = pserv.getimg(prod_id);
	       Cookie c = new Cookie("cookie", url);
	         c.setMaxAge(60*60);
	         response.addCookie(c);
	         String val = c.getValue();
	         
	         model.addAttribute("val", val);
	   
	      return "user/product";
	   }
	   
}

































