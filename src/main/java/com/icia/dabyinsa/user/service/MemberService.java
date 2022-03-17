package com.icia.dabyinsa.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.ReturnedType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.dabyinsa.user.dao.MemberDao;
import com.icia.dabyinsa.user.dto.MemberDto;
import com.icia.dabyinsa.user.dto.OrderDto;

import lombok.extern.java.Log;

@Service
@Log
public class MemberService {
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	ModelAndView mv;
	
	@Transactional
	public String memberInsert(MemberDto member, 
			RedirectAttributes rttr) {
		log.info("memberInsert()");
		String view = null;
		String msg = null;
		
		
		String rawPassword = member.getM_pass();// 비밀번호 원문
		String encPassword = encoder.encode(rawPassword); // 해쉬 값
		member.setM_pass(encPassword);
		
		try {
			mDao.memberInsert(member);	
			view = "redirect:loginForm";
			msg = "가입 성공";
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:joinFrm";
			msg = "가입 실패, 빈칸 없이 다 입력해주세요";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return view;
	}
	
	public String idCheck(String id) {
		String res = null;
		
		//아이디를 검색하여 중복 아이디가 있으면 1,
		//없으면 0이 넘어옴.
		int cnt = mDao.idCheck(id);
		if(cnt == 0) {
			res = "ok";
		}
		else {
			res = "fail";
		}
		
		return res;
	}
	
	public int orderBefore(int number) {
		
		return mDao.orderBefore(number);
	}
	
	public int payment(int number) {
		return mDao.payment(number);
		
	}
	
	public MemberDto login(String m_id) {
		MemberDto mDto = mDao.login(m_id);
		
		return mDto;
		
	}
	
	//회원 전화번호 수정
	@Transactional
	public String memberUpdate(String id, String phone,
			RedirectAttributes rttr) {
		String view = null;
		String msg = null;

		try {
			mDao.memberUpdate(id, phone);
			msg = "수정 성공";
			view = "redirect:infoUpdatePage";
			
		} catch (Exception e) {
			
			msg = "수정 실패";
			view = "redirect:infoUpdatePage";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		
		
		return view;
		
		
	}
	
	//회원 이메일 수정
	@Transactional
	public String emailUpdate(String id, String email,
			RedirectAttributes rttr) {
		String view = null;
		String msg = null;

		try {
			mDao.emailUpdate(id, email);
			msg = "수정 성공";
			view = "redirect:infoUpdatePage";
			
		} catch (Exception e) {
			
			msg = "수정 실패";
			view = "redirect:infoUpdatePage";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		
		
		return view;
		
		
	}
	
	//회원 비밀번호 수정
	@Transactional
	public String passUpdate(String pass, MemberDto member,
			RedirectAttributes rttr) {
		String view = null;
		String msg = null;
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		//String updatePassword = member.getM_pass();// 비밀번호 원문
		System.out.println(pass);
		String encPassword = encoder.encode(pass); // 해쉬 값
		member.setM_pass(encPassword);
		System.out.println("encpw : "+encPassword);

		try {
			mDao.passUpdate(member);
			msg = "수정 성공";
			view = "redirect:infoUpdatePage";
			
		} catch (Exception e) {
			
			msg = "수정 실패";
			view = "redirect:infoUpdatePage";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		
		
		return view;
		
		
	}
	
	//회원탈퇴
	@Transactional
	public String memberDelete(RedirectAttributes rttr, String id) {
		String view = null;
		String msg = null;
		
		try {
			mDao.memberDelete(id);
			
			session.invalidate();
			view = "redirect:/";
			msg = "탈퇴 성공";
			
			
		} catch (Exception e) {
			
			view = "redirect:index";
			msg = "탈퇴 실패";

		}
		
		rttr.addFlashAttribute("msg", msg);
		return view;
	}
	

	public String findMemberId(String m_name, String m_email
			) {

		 	
		return mDao.findMemberId(m_name, m_email);
	}
	
	



	public List<OrderDto> odStatus(String m_id) {
		return mDao.opStatus(m_id);		
	}
	

	


}
