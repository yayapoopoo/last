package com.icia.dabyinsa.board.event;

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

import com.icia.dabyinsa.board.event.dto.event_BfileDto;
import com.icia.dabyinsa.board.event.dto.event_ReplyDto;
import com.icia.dabyinsa.board.event.service.event_BoardService;
import com.icia.dabyinsa.user.dto.MemberDto;
import com.icia.dabyinsa.user.service.MemberService;

@Controller
public class event_BoardController {

	private static final Logger logger = 
			LoggerFactory.getLogger(event_BoardController.class);

	
	@Autowired
	private event_BoardService bServ;
	@Autowired
	private MemberService ms;
	
	private ModelAndView mv;
	
	@GetMapping("event_list")
	public ModelAndView boardList(Integer pageNum, Model model, Principal p) {
		
		logger.info("board/event_boardList()");
		
		mv = bServ.getBoardList(pageNum);
		
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);

		return mv;
	}
	
	@GetMapping("event_writeFrm")
	public String writeFrm(Model model, Principal p) {
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		logger.info("board/event_writeFrm()");
		
		return "writeFrm";
	}
	
	@PostMapping("boardWrite")
	public String boardWrite(MultipartHttpServletRequest multi,
			RedirectAttributes rttr, Model model, Principal p) {
		logger.info("boardWrite()");
		
		String view = bServ.boardInsert(multi, rttr);
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		return view;
	}
	
	@GetMapping("event_contents")
	public ModelAndView boardContents(Integer bnum, Model model, Principal p) {
		logger.info("board/event_boardContents() - bnum : " + bnum);
		
		mv = bServ.getContents(bnum);
		
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		
		return mv;
	}
	
	@GetMapping("event_download")
	public void fileDownLoad(event_BfileDto bfile, 
			HttpServletResponse res, Model model, Principal p) {
		logger.info("fileDownLoad() - oriname : " 
			+ bfile.getBf_oriname());
		
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		bServ.fileDownload(bfile, res);
	}
	
	@PostMapping(value = "event_replyIns",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<event_ReplyDto>> replyInsert(event_ReplyDto reply, Model model, Principal p){
		logger.info("replyInsert()");
		
		Map<String, List<event_ReplyDto>> rmap = bServ.replyInsert(reply);
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		return rmap;
	}
	
	@GetMapping("event_updateFrm")
	public ModelAndView updateFrm(int bnum, 
			RedirectAttributes rttr, Model model, Principal p) {
		logger.info("board/event_updateFrm() - bnum: " + bnum);
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		mv = bServ.updateFrm(bnum, rttr);
		
		return mv;
	}
	
	@PostMapping("boardUpdate")
	public String boardUpdate(MultipartHttpServletRequest multi,
			RedirectAttributes rttr, Model model, Principal p) {
		logger.info("boardUpdate()");
		String view = bServ.boardUpdate(multi, rttr);
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		return view;
	}
	
	@PostMapping(value = "event_delfile",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<event_BfileDto>> delFile(String sysname, int bnum, Model model, Principal p) {
		logger.info("delFile()");
		
		Map<String, List<event_BfileDto>> rMap = null;
		
		rMap = bServ.fileDelete(sysname, bnum);
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		return rMap;
	}
	
	@GetMapping("event_delete")
	public String boardDelete(int bnum, 
			RedirectAttributes rttr, Model model, Principal p) {
		logger.info("boardDelete() - bnum: " + bnum);
		
		String view = bServ.boardDelete(bnum, rttr);
		MemberDto member = ms.login(p.getName());
		model.addAttribute("mb", member);
		return view;
	}
}








