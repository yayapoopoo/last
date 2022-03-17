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

import com.icia.dabyinsa.user.dao.MiligeDao;
import com.icia.dabyinsa.user.dto.MiligeDto;

@Controller
@RequestMapping
public class MiligeController {
	@Autowired
	MiligeDao miDao;
	
	@Secured("ROLE_USER")
	@RequestMapping("miList")
	public ModelAndView miList(Principal p) {
		Map<String, Object> map=new HashMap<>();
		String m_id= p.getName();
		ModelAndView mav = new ModelAndView();
		if(m_id!=null) {			
			List<MiligeDto> miList=miDao.miList(m_id);
			map.put("miList", miList);
			map.put("micount", miList.size());
			mav.setViewName("user/milige");
			mav.addObject("mimap", map);
			return mav;
		}else {
			mav.setViewName("redirect:loginForm");
			mav.addObject("mimap", map);
			return mav;
		}
	}
}
