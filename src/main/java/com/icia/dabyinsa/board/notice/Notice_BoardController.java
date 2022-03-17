package com.icia.dabyinsa.board.notice;

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

import com.icia.dabyinsa.board.notice.dto.Notice_BfileDto;
import com.icia.dabyinsa.board.notice.dto.Notice_ReplyDto;
import com.icia.dabyinsa.board.notice.service.Notice_BoardService;
import com.icia.dabyinsa.user.dto.MemberDto;
import com.icia.dabyinsa.user.service.MemberService;

@Controller
public class Notice_BoardController {

	private static final Logger logger = 
			LoggerFactory.getLogger(Notice_BoardController.class);

	@Autowired
	private Notice_BoardService bServ;

	//member 정보 불러올 때
	@Autowired
	private MemberService ms;

	private ModelAndView mv;

	@GetMapping("notice_list")                           	//member 정보 눌러올 때
	public ModelAndView Notice_boardList(Integer pageNum, Model model, Principal p) {
		//pageNum에 들어오는 데이터
		// 1. null - url에 페이지번호를 작성하지 않을 때
		//			첫번째 페이지가 보여지는 상황.(로그인한 직후)
		// 2. 페이지 번호 숫자.
		logger.info("Notice_boardList()");

		//DB에서 게시글을 가져와서 페이지로 전달.
		mv = bServ.getBoardList(pageNum);

		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		return mv;
	}

	@GetMapping("notice_writeFrm")
	public String Notice_writeFrm(Model model, Principal p) {
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		logger.info("Notice_writeFrm()");
		return "board/Notice_writeFrm";
	}

	//멀티파트 데이터를 처리할 경우 첫번째 매개변수는 
	//MultipartServletRequest 여야 한다.
	@PostMapping("notice_boardWrite")
	public String Notice_boardWrite(MultipartHttpServletRequest multi,
			RedirectAttributes rttr, Model model, Principal p) {
		logger.info("Notice_boardWrite()");

		String view = bServ.boardInsert(multi, rttr);

		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		return view;
	}

	@GetMapping("notice_contents")
	public ModelAndView Notice_boardContents(Integer bnum, Model model, Principal p) {
		logger.info("Notice_boardContents() - bnum : " + bnum);

		//서비스에서 mv 내용을 만들어서 보내주도록 처리
		mv = bServ.getContents(bnum);

		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		return mv;
	}

	@GetMapping("notice_download")
	public void fileDownLoad(Notice_BfileDto bfile, 
			HttpServletResponse res, Model model, Principal p) {
		logger.info("fileDownLoad() - oriname : " 
				+ bfile.getBf_oriname());

		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		bServ.fileDownload(bfile, res);
	}

	@PostMapping(value = "notice_replyIns",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<Notice_ReplyDto>> replyInsert(Notice_ReplyDto reply, Model model, Principal p){
		logger.info("replyInsert()");

		Map<String, List<Notice_ReplyDto>> rmap = bServ.replyInsert(reply);
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		return rmap;//이 때 Map -> json으로 변경됨(jackson 라이브러리)
	}

	@GetMapping("notice_updateFrm")
	public ModelAndView Notice_updateFrm(int bnum, 
			RedirectAttributes rttr, Model model, Principal p) {
		logger.info("Notice_updateFrm() - bnum: " + bnum);

		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		
		mv = bServ.updateFrm(bnum, rttr);

		return mv;
	}

	@PostMapping("notice_boardUpdate")
	public String Notice_boardUpdate(MultipartHttpServletRequest multi,
			RedirectAttributes rttr, Model model, Principal p) {
		logger.info("Notice_boardUpdate()");
		String view = bServ.boardUpdate(multi, rttr);
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		return view;
	}

	@PostMapping(value = "notice_delfile",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<Notice_BfileDto>> delFile(String sysname, int bnum, Model model, Principal p) {
		logger.info("notice_delFile()");

		Map<String, List<Notice_BfileDto>> rMap = null;

		rMap = bServ.fileDelete(sysname, bnum);
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		return rMap;
	}

	@GetMapping("notice_delete")
	public String boardDelete(int bnum, 
			RedirectAttributes rttr, Model model, Principal p) {
		logger.info("boardDelete() - bnum: " + bnum);

		String view = bServ.boardDelete(bnum, rttr);
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		return view;
	}
}//class end








