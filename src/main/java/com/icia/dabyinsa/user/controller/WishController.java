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

import com.icia.dabyinsa.user.dao.WishDao;
import com.icia.dabyinsa.user.dto.WishDto;

@Controller
@RequestMapping("/user/wish/*")
public class WishController {

	@Autowired
	WishDao wishDao;
	
	@Secured("ROLE_USER")
	@RequestMapping("wishInsert")
	public String wishInsert(WishDto dto, HttpSession session) {
		String m_id=(String)session.getAttribute("m_id");
		if(m_id==null) {
			return "redirect:/user/login";
		}
		dto.setM_id(m_id);
		wishDao.wishInsert(dto);
		return "redirect:/user/wish/wishList";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping("wishDelete")
	public String wishDelete(int w_id) {
		wishDao.wishDelete(w_id);
		return "redirect:/user/wish/wishList";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping("wishDeleteAll")
	public String wishDeleteAll(HttpSession session, Principal p) {
		String m_id= p.getName();
		if(m_id!=null) {
			wishDao.wishDelete_all(m_id);
		}
		return "redirect:/user/wish/wishList";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping("wishList")
	public ModelAndView wishList(HttpSession session, ModelAndView mav, Principal p) {
		Map<String, Object> map=new HashMap<>();
		String m_id= p.getName();
		if(m_id!=null) {
			List<WishDto> wishList=wishDao.wishList(m_id);
			map.put("wishList", wishList);
			map.put("wishCount", wishList.size());
			mav.setViewName("user/wishList");
			mav.addObject("wmap", map);
			return mav;
		}else {
			mav.setViewName("redirect:loginForm");
			mav.addObject("wmap", map);
			return mav;
		}
	}
}
