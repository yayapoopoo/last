package com.icia.dabyinsa.board.qrcode;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.dabyinsa.board.qrcode.dto.QfileDto;
import com.icia.dabyinsa.board.qrcode.dto.GuestDto;
import com.icia.dabyinsa.board.qrcode.service.QrcodeService;
import com.icia.dabyinsa.user.dto.MemberDto;
import com.icia.dabyinsa.user.service.MemberService;

@Controller
public class QrcodeController {

	private static final Logger logger = 
			LoggerFactory.getLogger(QrcodeController.class);

	@Autowired
	private QrcodeService qServ;
	
	//member 정보 불러올 때
	@Autowired
	private MemberService ms;
	
	private ModelAndView mv;
	
	@GetMapping("list")
	public ModelAndView qrcodeList(Integer pageNum, Model model, Principal p) {
		//pageNum에 들어오는 데이터
		// 1. null - url에 페이지번호를 작성하지 않을 때
		//			첫번째 페이지가 보여지는 상황.(로그인한 직후)
		// 2. 페이지 번호 숫자.
		logger.info("qrcodeList()");
		
		//DB에서 게시글을 가져와서 페이지로 전달.
		mv = qServ.getQrcodeList(pageNum, p);
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		return mv;
	}
	
	@GetMapping("writeFrm")
	public String writeFrm(Model model, Principal p) {
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		logger.info("writeFrm()");		
		return "board/writeFrm";
	}
	
	//멀티파트 데이터를 처리할 경우 첫번째 매개변수는 
	//MultipartServletRequest 여야 한다.
	@PostMapping("qrcodeWrite")
	public String qrcodeWrite(MultipartHttpServletRequest multi,
			RedirectAttributes rttr, Model model, Principal p) {
		logger.info("qrcodeWrite()");
		
		String view = qServ.qrcodeInsert(multi, rttr);
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		
		return view;
	}
	
	@GetMapping("contents")
	public ModelAndView qrcodeContents(Integer qnum, Model model, Principal p) {
		logger.info("qrcodeContents() - qnum : " + qnum);
		
		//서비스에서 mv 내용을 만들어서 보내주도록 처리
		mv = qServ.getContents(qnum);
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		
		return mv;
	}
	
	@GetMapping("download")
	public void fileDownLoad(QfileDto qfile, 
			HttpServletResponse res, Model model, Principal p) {
		logger.info("fileDownLoad() - oriname : " 
			+ qfile.getQf_oriname());
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		
		qServ.fileDownload(qfile, res);
	}
	
	@PostMapping(value = "guestIns",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<GuestDto>> guestInsert(GuestDto guest, Model model, Principal p){
		logger.info("guestInsert()");
		
		Map<String, List<GuestDto>> gmap = qServ.guestInsert(guest);
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		
		return gmap;//이 때 Map -> json으로 변경됨(jackson 라이브러리)
	}
	
	@GetMapping("updateFrm")
	public ModelAndView updateFrm(int qnum, 
			RedirectAttributes rttr, Model model, Principal p) {
		logger.info("updateFrm() - qnum: " + qnum);
		
		mv = qServ.updateFrm(qnum, rttr);
		
		return mv;
	}
	
	@PostMapping("qrcodeUpdate")
	public String qrcodeUpdate(MultipartHttpServletRequest multi,
			RedirectAttributes rttr, Model model, Principal p) {
		logger.info("qrcodeUpdate()");
		String view = qServ.qrcodeUpdate(multi, rttr);
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		
		return view;
	}
	
	@PostMapping(value = "delfile",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<QfileDto>> delFile(String sysname, int qnum, Model model, Principal p) {
		logger.info("delFile()");
		
		Map<String, List<QfileDto>> gMap = null;
		
		gMap = qServ.fileDelete(sysname, qnum);
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		
		return gMap;
	}
	
	@GetMapping("delete")
	public String qrcodeDelete(int qnum, 
			RedirectAttributes rttr, Model model, Principal p) {
		logger.info("qrcodeDelete() - qnum: " + qnum);
		
		String view = qServ.qrcodeDelete(qnum, rttr);
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		
		return view;
	}
	
	@GetMapping("thanks")
	public String thanks(Model model, Principal p) {
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		logger.info("thanks()");		
		return "board/thanks";
	}
	
	@GetMapping("recomProd")
	public String recomProd(Model model, Principal p) {
		logger.info("recomProd()");
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		
		return "board/recomProd";
	}
	
	@GetMapping("qrimg")
	public ModelAndView qrimg(int qnum, Model model, Principal p) {
		logger.info("qrimg() - int qnum=" + qnum);
		
		ModelAndView mv = new ModelAndView();
		String resUrl = "http://localhost:70/qrcode/contents?qnum=" + qnum;
		mv.addObject("resUrl", resUrl);
		mv.setViewName("board/qrimg");
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		
		return mv;
	}
	
}//class end