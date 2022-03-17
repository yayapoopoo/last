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

import com.icia.dabyinsa.user.dao.CartDao;
import com.icia.dabyinsa.user.dto.CartDto;

@Controller
@RequestMapping("/user/cart/*")
public class CartController {
	@Autowired
	CartDao cartDao;
	
	
	@Secured("ROLE_USER")
	@RequestMapping("delete")
	public String delete(int cart_id) {
		cartDao.delete(cart_id);
		return "redirect:/user/cart/list";
	}
	@Secured("ROLE_USER")
	@RequestMapping("deleteAll")
	public String deleteAll(HttpSession session, Principal p) {
		//String m_id=(String)session.getAttribute("m_id");
		String m_id= p.getName();
		if(m_id!=null) {
			cartDao.delete_all(m_id);
		}
		return "redirect:/user/cart/list";
	}
	@Secured("ROLE_USER")
	@RequestMapping("update")
	public String update(int[] amount, int[] cart_id, HttpSession session, Principal p) {
		//String m_id=(String)session.getAttribute("m_id");
		String m_id= p.getName();
		for(int i=0; i<cart_id.length; i++) {
			if(amount[i]==0) {
				cartDao.delete(cart_id[i]);
			}else {
				CartDto dto=new CartDto();
				dto.setM_id(m_id);
				dto.setCart_id(cart_id[i]);
				dto.setAmount(amount[i]);
				cartDao.update(dto);
			}
		
		}
		return "redirect:/user/cart/list";
	}
	@Secured("ROLE_USER")
	@RequestMapping("list")
	public ModelAndView list(HttpSession session, ModelAndView mav, Principal p) {
		Map<String, Object> map=new HashMap<>();
		//String m_id=(String)session.getAttribute("m_id");
		String m_id= p.getName();
		if(m_id!=null) {
			List<CartDto> list=cartDao.list(m_id);
			int sumMoney=cartDao.sum_money(m_id);
			int fee=sumMoney>=30000?0:3000;
			map.put("sumMoney", sumMoney);
			map.put("fee", fee);
			map.put("sum", sumMoney+fee);
			map.put("list", list);
			map.put("count", list.size());
			mav.setViewName("user/cart_list");
			mav.addObject("map", map);
			return mav;
		}else {
			mav.setViewName("redirect:loginForm");
			mav.addObject("map", map);
			return mav;
		}
	}
	@Secured("ROLE_USER")
	@RequestMapping("cinsert")
	public String insert(String[] chk, Principal p) {
		System.out.println(chk);
		//String m_id=(String)session.getAttribute("m_id");
		String m_id= p.getName();
		if(m_id==null) {
			return "redirect:/user/login";
		}
		for(String s : chk) {
			CartDto c = new CartDto();
			c.setM_id(m_id);
			c.setProd_id(s);
			cartDao.cinsert(c);
		}
//		dto.setM_id(m_id);
//		cartDao.cinsert(dto);
		return "redirect:/user/cart/list";
	}
	@Secured("ROLE_USER")
	@RequestMapping("cainsert")
	public String cainsert(CartDto dto, HttpSession session, Principal p) {
		//String m_id=(String)session.getAttribute("m_id");
		String m_id= p.getName();
		if(m_id==null) {
			return "redirect:/user/login";
		}
		dto.setM_id(m_id);
		cartDao.cainsert(dto);
		return "redirect:/user/cart/list";
	}
	
}
	
