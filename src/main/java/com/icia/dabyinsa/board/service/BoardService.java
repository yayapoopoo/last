package com.icia.dabyinsa.board.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.dabyinsa.board.dao.BoardDao;
import com.icia.dabyinsa.board.dto.BfileDto;
import com.icia.dabyinsa.board.dto.BoardDto;
import com.icia.dabyinsa.board.dto.ReplyDto;
import com.icia.dabyinsa.board.util.PagingUtil;
import com.icia.dabyinsa.user.dto.MemberDto;

import lombok.extern.java.Log;

@Service
@Log
public class BoardService {
	@Autowired
	private BoardDao bDao;
	@Autowired
	private HttpSession session;
	
	private ModelAndView mv;
	
	private int listCnt = 15;
	
	public ModelAndView getBoardList(Integer pageNum) {
		mv = new ModelAndView();
		
		int num = (pageNum == null)? 1 : pageNum;
		Map<String, Integer> pmap = 
				new HashMap<String, Integer>();
		pmap.put("num", num);
		pmap.put("lcnt", listCnt);
		
		List<BoardDto> bList = bDao.getList(pmap);
		
		mv.addObject("bList", bList);
		
		String pageHtml = getPaging(num);
		mv.addObject("paging", pageHtml);
		
		session.setAttribute("pageNum", num);
		
		mv.setViewName("boardList");
		
		return mv;
	}

	private String getPaging(int num) {
		String pageHtml = null;
		
		int maxNum = bDao.getBoardCnt();
		int pageCnt = 2;
		String listName = "list";
		
		PagingUtil paging = new PagingUtil(maxNum, num, listCnt, 
				pageCnt, listName);
		
		pageHtml = paging.makePaging();
		
		return pageHtml;
	}
	
	@Transactional
	public String boardInsert(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		String view = null;
		String msg = null;
		
		String id = multi.getParameter("bid");
		String title = multi.getParameter("btitle");
		String content = multi.getParameter("bcontents");
		String check = multi.getParameter("fileCheck");
		
		content = content.trim();
		
		BoardDto board = new BoardDto();
		board.setBid(id);
		board.setBtitle(title);
		board.setBcontents(content);
		
		try {
			bDao.boardInsert(board);
			
			if(check.equals("1")) {
				fileUpload(multi, board.getBnum());
			}
			
			
			view = "redirect:list";
			msg = "글 작성 성공";
		} catch (Exception e) {
			//e.printStackTrace();
			view = "redirect:writeFrm";
			msg = "글 작성 실패";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return view;
	}

	private void fileUpload(MultipartHttpServletRequest multi, 
			int bnum) throws Exception {
		
		String realPath = session.getServletContext()
				.getRealPath("/");
		
		realPath += "WEB-INF/views/upload/";
		
		File folder = new File(realPath);
		if(folder.isDirectory() == false) {
			folder.mkdir();
		}
		
		Map<String, String> fmap = new HashMap<String, String>();
		fmap.put("bnum", String.valueOf(bnum));
		
		Iterator<String> files = multi.getFileNames();
		
		while(files.hasNext()) {
			String fn = files.next();
			
			List<MultipartFile> fList = multi.getFiles(fn);
			
			for(int i = 0; i < fList.size(); i++) {
				MultipartFile mf = fList.get(i);
				
				String orname = mf.getOriginalFilename();
				
				
				String syname = System.currentTimeMillis()
						+ orname.substring(orname.lastIndexOf("."));
				
				
				fmap.put("oriName", orname);
				fmap.put("sysName", syname);
				
				
				File ff = new File(realPath + syname);
				mf.transferTo(ff);
				
				
				bDao.fileInsert(fmap);
			}
		}
		
	}
	
	public ModelAndView getContents(Integer bnum) {
		mv = new ModelAndView();
		
		
		bDao.viewUpdate(bnum);
		
		
		BoardDto board = bDao.getContents(bnum);
		
		List<BfileDto> bfList = bDao.getBfList(bnum);
		
		List<ReplyDto> rList = bDao.getReList(bnum);
		
		
		mv.addObject("board", board);
		mv.addObject("fList", bfList);
		mv.addObject("rList", rList);
		
		
		mv.setViewName("boardContents");
		
		return mv;
	}
	
	public void fileDownload(BfileDto bfile, 
			HttpServletResponse res) {
		
		
		String realPath = session.getServletContext()
				.getRealPath("/");
		realPath += "resources/upload/";
		
		
		String oName = bfile.getBf_oriname();
		
		realPath += bfile.getBf_sysname();
		
		
		InputStream is = null;
		
		OutputStream os = null;
		
		try {
			String dfName = URLEncoder.encode(oName, "UTF-8");
			
			File file = new File(realPath);
			is = new FileInputStream(file);
			
			res.setContentType("application/octet-stream");
			res.setHeader("content-Disposition", 
					"attachment; filename=\"" + dfName + "\"");
			
			os = res.getOutputStream();
			
			byte[] buffer = new byte[1024];
			int length;
			while((length = is.read(buffer)) != -1) {
				os.write(buffer, 0, length);
			}
		} catch (Exception e) {
			//e.printStackTrace();			
		} finally {
			try {
				os.flush();
				os.close();
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Transactional
	public Map<String, List<ReplyDto>> replyInsert(ReplyDto reply){
		Map<String, List<ReplyDto>> rmap = null;
		
		try {
			bDao.replyInsert(reply);
			
			List<ReplyDto> rList = bDao.getReList(reply.getR_bnum());
			
			rmap = new HashMap<String, List<ReplyDto>>();
			rmap.put("rList", rList);
		} catch (Exception e) {
			e.printStackTrace();
			rmap = null;
		}
		
		return rmap;
	}

	public ModelAndView updateFrm(int bnum, 
			RedirectAttributes rttr) {
		mv = new ModelAndView();
		
		BoardDto board = bDao.getContents(bnum);
		
		MemberDto member = 
				(MemberDto)session.getAttribute("mb");
		
		mv.addObject("board", board);
		List<BfileDto> bfList = bDao.getBfList(bnum);
		mv.addObject("bfList", bfList);
		mv.setViewName("updateFrm");
				
		return mv;
	}
	
	@Transactional
	public String boardUpdate(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		String view = null;
		
		String bnum = multi.getParameter("bnum");
		String title = multi.getParameter("btitle");
		String contents = multi.getParameter("bcontents");
		String id = multi.getParameter("bid");
		String check = multi.getParameter("fileCheck");
		
		contents = contents.trim();
		
		
		BoardDto board = new BoardDto();
		board.setBnum(Integer.parseInt(bnum));
		board.setBtitle(title);
		board.setBcontents(contents);
		board.setBid(id);
		
		try {
			bDao.boardUpdate(board);
			
			if(check.equals("1")) {
				fileUpload(multi, board.getBnum());
			}
			
			rttr.addFlashAttribute("msg", "수정 성공");
		} catch (Exception e) {
			// TODO: handle exception
			rttr.addFlashAttribute("msg", "수정 실패");
		}
		
		view = "redirect:contents?bnum=" + bnum;
		
		return view;
	}
	
	@Transactional
	public Map<String, List<BfileDto>> fileDelete(String sysname, int bnum) {
		Map<String, List<BfileDto>> rMap = null;
		
		String path = session.getServletContext()
				.getRealPath("/");
		
		path += "resources/upload/" + sysname;
		
		try {
			bDao.fileDelete(sysname);
			
			File file = new File(path);
			
			if(file.exists()) {
				if(file.delete()) {
					List<BfileDto> fList = bDao.getBfList(bnum);
					rMap = new HashMap<String, List<BfileDto>>();
					rMap.put("fList", fList);
				}
				else {
					rMap = null;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			rMap = null;
		}
		
		return rMap;
	}
	
	@Transactional
	public String boardDelete(int bnum, 
			RedirectAttributes rttr) {
		
		String view = null;
		
		try {
			
			bDao.replyDelete(bnum);
			
			bDao.filesListDelete(bnum);
			
			bDao.boardDelete(bnum);
			
			view = "redirect:list";
			rttr.addFlashAttribute("msg", "삭제 성공");
			
		} catch (Exception e) {
			//e.printStackTrace();
			view = "redirect:contents?bnum=" + bnum;
			rttr.addFlashAttribute("msg", "삭제 실패");
		}
		
		return view;
	}
}






