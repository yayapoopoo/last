package com.icia.dabyinsa.board.review;

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

import com.icia.dabyinsa.board.review.dto.review_BfileDto;
import com.icia.dabyinsa.board.review.dto.review_ReplyDto;
import com.icia.dabyinsa.board.review.service.review_BoardService;
import com.icia.dabyinsa.user.dto.MemberDto;
import com.icia.dabyinsa.user.service.MemberService;

@Controller
public class review_BoardController {

	private static final Logger logger = 
			LoggerFactory.getLogger(review_BoardController.class);

	@Autowired
	private review_BoardService bServ;

	//member 정보 불러올 때
	@Autowired
	private MemberService ms;

	private ModelAndView mv;

	@GetMapping("review_list")                           	//member 정보 눌러올 때
	public ModelAndView review_boardList(Integer pageNum, Model model, Principal p) {
		//pageNum에 들어오는 데이터
		// 1. null - url에 페이지번호를 작성하지 않을 때
		//			첫번째 페이지가 보여지는 상황.(로그인한 직후)
		// 2. 페이지 번호 숫자.
		logger.info("review_boardList()");

		//DB에서 게시글을 가져와서 페이지로 전달.
		mv = bServ.getBoardList(pageNum);

		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		return mv;
	}

	@GetMapping("review_writeFrm")
	public String review_writeFrm(Model model, Principal p) {
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		logger.info("review_writeFrm()");
		return "board/review_writeFrm";
	}

	//멀티파트 데이터를 처리할 경우 첫번째 매개변수는 
	//MultipartServletRequest 여야 한다.
	@PostMapping("review_boardWrite")
	public String review_boardWrite(MultipartHttpServletRequest multi,
			RedirectAttributes rttr, Model model, Principal p) {
		logger.info("review_boardWrite()");

		String view = bServ.boardInsert(multi, rttr);

		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		return view;
	}

	@GetMapping("review_contents")
	public ModelAndView review_boardContents(Integer bnum, Model model, Principal p) {
		logger.info("review_boardContents() - bnum : " + bnum);

		//서비스에서 mv 내용을 만들어서 보내주도록 처리
		mv = bServ.getContents(bnum);

		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		return mv;
	}

	@GetMapping("review_download")
	public void fileDownLoad(review_BfileDto bfile, 
			HttpServletResponse res, Model model, Principal p) {
		logger.info("fileDownLoad() - oriname : " 
				+ bfile.getBf_oriname());

		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		bServ.fileDownload(bfile, res);
	}

	@PostMapping(value = "review_replyIns",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<review_ReplyDto>> replyInsert(review_ReplyDto reply, Model model, Principal p){
		logger.info("replyInsert()");

		Map<String, List<review_ReplyDto>> rmap = bServ.replyInsert(reply);
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		return rmap;//이 때 Map -> json으로 변경됨(jackson 라이브러리)
	}

	@GetMapping("review_updateFrm")
	public ModelAndView review_updateFrm(int bnum, 
			RedirectAttributes rttr, Model model, Principal p) {
		logger.info("review_updateFrm() - bnum: " + bnum);

		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		
		mv = bServ.updateFrm(bnum, rttr);

		return mv;
	}

	@PostMapping("review_boardUpdate")
	public String review_boardUpdate(MultipartHttpServletRequest multi,
			RedirectAttributes rttr, Model model, Principal p) {
		logger.info("review_boardUpdate()");
		String view = bServ.boardUpdate(multi, rttr);
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		return view;
	}

	@PostMapping(value = "review_delfile",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<review_BfileDto>> delFile(String sysname, int bnum, Model model, Principal p) {
		logger.info("review_delFile()");

		Map<String, List<review_BfileDto>> rMap = null;

		rMap = bServ.fileDelete(sysname, bnum);
		
		//member 정보 불러올 때
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		return rMap;
	}

	@GetMapping("review_delete")
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








