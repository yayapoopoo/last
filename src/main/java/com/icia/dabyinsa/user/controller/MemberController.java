package com.icia.dabyinsa.user.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.dabyinsa.config.auth.PrincipalDetail;
import com.icia.dabyinsa.user.dao.MemberDao;
import com.icia.dabyinsa.user.dto.MemberDto;
import com.icia.dabyinsa.user.dto.OrderDto;
import com.icia.dabyinsa.user.service.MemberService;


@Controller
public class MemberController {

	@Autowired
	private MemberService mServ;

	ModelAndView mv;

	@Autowired
	MemberDao mDao;

	@GetMapping("/loginForm")
	public String loginForm() {
		
		return "user/loginForm";
	}

	@GetMapping("joinFrm")
	public String joinFrm() {

		return "user/joinFrm";
	}

	@PostMapping("memInsert")
	public String memberInsert(MemberDto member, RedirectAttributes rttr) {

		String view = mServ.memberInsert(member, rttr);
		System.out.println(member);
		return view;
	}

	@GetMapping("findId")
	public String findId() {

		return "user/findId";
	}

	@GetMapping("findMemberId")
	public String findMemberId(@Param("m_name") String m_name,
			@Param("m_email") String m_email, Model model) {

		String id = mServ.findMemberId(m_name, m_email);

		model.addAttribute("id", id);

		return "user/findId";
	}

	@GetMapping("findPwPage")
	public String findPw() {

		return "user/findPw";
	}
	@Secured("ROLE_USER")
	@GetMapping("infoUpdatePage")
	public String infoUpdatePage(Model model, Principal p) {
//		String m_id = (String) session.getAttribute("m_id");

		String m_id = p.getName();
		
		MemberDto mDto = mServ.login(m_id);

		model.addAttribute("mDto", mDto);
		
		

		return "user/infoUpdatePage";
	}

	@PostMapping("memberUpdate")
	public String memberUpdate(String id, String phone, RedirectAttributes rttr, Model model, Principal p) {

		id = p.getName();
		System.out.println("id : " + id);
		System.out.println("phone : " + phone);
		String view = mServ.memberUpdate(id, phone, rttr);

		return view;
	}

	@PostMapping("emailUpdate")
	public String emailUpdate(String id, String email, RedirectAttributes rttr, Model model, Principal p) {

		id = p.getName();
		System.out.println("id : " + id);
		System.out.println("email : " + email);
		String view = mServ.emailUpdate(id, email, rttr);

		return view;
	}

	@PostMapping("passUpdate")
	public String passUpdate(String pass, RedirectAttributes rttr, Model model, Principal p) {

		String id = p.getName();
		MemberDto member = mServ.login(id);
		System.out.println("id : " + id);
		System.out.println("pass : " + pass);
		String view = mServ.passUpdate(pass, member, rttr);

		return view;
	}
	@Secured("ROLE_USER")
	@GetMapping("myPage")
	public String myPage(Model model, Principal p) {
		
		String m_id = p.getName();
		
		if(m_id == null) {
			
			return "user/loginForm";
		}
		
		/*
		int count = mServ.orderBefore(1);
		int count1 = mServ.orderBefore(2);
		int count2 = mServ.orderBefore(3);
		int count3 = mServ.orderBefore(4);
		int count4 = mServ.orderBefore(5);
		int count5 = mServ.orderBefore(6);
		int count6 = mServ.payment(0);
		int count7 = mServ.payment(1);

		// 배송전
		model.addAttribute("orderBefore", count);
		// 배송중
		model.addAttribute("ordering", count1);
		// 배송완료
		model.addAttribute("orderComplete", count2);
		// 취소
		model.addAttribute("ordercancle", count3);
		// 교환
		model.addAttribute("orderChange", count4);
		// 반품
		model.addAttribute("ordereturn", count5);
		// 결제 전
		model.addAttribute("payBefore", count6);
		// 결제 완료
		model.addAttribute("payAfter", count7);
		*/
		
		
		/////////////////////////////////////////////////////////
		
		java.util.List<OrderDto> odList = mServ.odStatus(m_id);
		
		int obSum = 0;//결제 전
		int oaSum = 0; //결제 후
		
		int dbSum = 0;//배송전
		int daSum = 0;//배송완료
		int diSum = 0;//배송중
		
		int cancle = 0;//취소
		int refund = 0;//반품
		int ret = 0;//교환
		
		
		for(OrderDto odDto : odList) {
			if(odDto.getP_status() == 0) {
				obSum++;
			}
				
			if(odDto.getP_status() == 1) {
				oaSum++;
			}
				
			if(odDto.getD_status() == 1) {
				dbSum++;
			}
				
			if(odDto.getD_status() == 3) {
				diSum++;
			}
				
			if(odDto.getD_status() == 4) {
				daSum++;
			}
				
			if(odDto.getProc_status() == 4)
				cancle++;
			if(odDto.getProc_status() == 5)
				ret++;
			if(odDto.getProc_status() == 6)
				refund++;
				
		}
		
		
		Map<String, Integer> cntData = new HashMap<String, Integer>();
		System.out.println(obSum);
		System.out.println(oaSum);
		System.out.println(dbSum);
		System.out.println(daSum);
		System.out.println(diSum);
		cntData.put("obSum", obSum);
		cntData.put("oaSum", oaSum);
		cntData.put("dbSum", dbSum);
		cntData.put("daSum", daSum);
		cntData.put("diSum", diSum);
		cntData.put("cancle", cancle);
		cntData.put("ret", ret);
		cntData.put("refund", refund);
		
		
		
		model.addAttribute("cntData", cntData);
		
		

		return "user/myPage";
	}

	@GetMapping(value = "idCheck", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String idCheck(String mid) {

		// 이후 해당 아이디로 DB를 검색하는 서비스와 Dao를 활용.
		String res = mServ.idCheck(mid);

		return res;
	}

	@GetMapping("memberDelete")
	public String memberDelete(RedirectAttributes rttr, String id, Principal p) {
		id = p.getName();

		String view = mServ.memberDelete(rttr, id);

		return view;
	}
	
	@GetMapping("/test/oauth/login")
	public @ResponseBody String testOauthLogin(
			Authentication authentication,
			@AuthenticationPrincipal OAuth2User oauth
			) {
		
		System.out.println("/test/login =============");
		OAuth2User oauth2User = (OAuth2User) authentication.getPrincipal();
		System.out.println("authentication: " + oauth2User.getAttributes());
		System.out.println("oauth2User: " + oauth.getAttributes());
		
		return "OAuth 세션 정보 확인하기";
	}
	
	@GetMapping("/test/login")
	public @ResponseBody String testLogin(Authentication authentication,
			@AuthenticationPrincipal PrincipalDetail userDetails) {
		
		System.out.println("/test/login =============");
		PrincipalDetail principalDetail = (PrincipalDetail) authentication.getPrincipal();
		System.out.println("authentication: " + principalDetail.getUser());
		
		System.out.println("userDetails: " + userDetails.getUser());
		return "세션 정보 확인하기";
	}
	
	
	
	



}
