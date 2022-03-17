package com.icia.dabyinsa.user.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.icia.dabyinsa.user.dao.CouponDao;
import com.icia.dabyinsa.user.dto.CouponDto;

@Controller
@RequestMapping("/user/coupon/*")
public class CouponController {
	@Autowired
	CouponDao cpDao;
	
	@Secured("ROLE_USER")
	@RequestMapping("cpInsert")
	public String cpInsert(CouponDto dto, Principal p) {
		System.out.println(dto.getCp_num());
		String m_id=p.getName();
		if(m_id==null) {
			return "redirect:/user/login";
		}
		dto.setM_id(m_id);
		cpDao.cpInsert(dto);
		return "redirect:/user/coupon/cpList";
	}
	@Secured("ROLE_USER")
	@RequestMapping("cpList")
	public ModelAndView cpList(Principal p) {
		Map<String, Object> map=new HashMap<>();
		String m_id= p.getName();
		ModelAndView mav = new ModelAndView();
		if(m_id!=null) {			
			List<CouponDto> cpList=cpDao.cpList(m_id);
			map.put("cpList", cpList);
			map.put("cpcount", cpList.size());
			mav.setViewName("user/coupon");
			mav.addObject("cpmap", map);
			return mav;
		}else {
			mav.setViewName("redirect:loginForm");
			mav.addObject("cpmap", map);
			return mav;
		}
	}

}
