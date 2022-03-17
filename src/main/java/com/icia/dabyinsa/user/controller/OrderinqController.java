package com.icia.dabyinsa.user.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.icia.dabyinsa.user.dao.OrderinqDao;
import com.icia.dabyinsa.user.dto.OrderinqDto;

@Controller
@RequestMapping
public class OrderinqController {
	
	@Autowired
	OrderinqDao oDao;

	@Secured("ROLE_USER")
	@RequestMapping("oiqList")
	public ModelAndView oiqList(HttpSession session, ModelAndView mav, Principal p) {
		Map<String, Object> map=new HashMap<>();
		String m_id= p.getName();
		if(m_id!=null) {
			List<OrderinqDto> oiqList=oDao.oiqList(m_id);
			map.put("oiqList", oiqList);
			map.put("oiqCount", oiqList.size());
			mav.setViewName("user/oiqList");
			mav.addObject("omap", map);
			return mav;
		}else {
			mav.setViewName("redirect:loginForm");
			mav.addObject("omap", map);
			return mav;
		}
	}
}
