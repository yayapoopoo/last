package com.icia.dabyinsa.board.review.service;

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

import com.icia.dabyinsa.board.event.util.PagingUtil;
import com.icia.dabyinsa.board.review.dao.review_BoardDao;
import com.icia.dabyinsa.board.review.dto.review_BfileDto;
import com.icia.dabyinsa.board.review.dto.review_BoardDto;
import com.icia.dabyinsa.board.review.dto.review_ReplyDto;
import com.icia.dabyinsa.user.dto.MemberDto;

import lombok.extern.java.Log;

@Service
@Log
public class review_BoardService {
	@Autowired
	private review_BoardDao bDao;
	@Autowired
	private HttpSession session;
	//point 증가 후 세션의 회원 정보를 변경하기 위해 필요
	
	private ModelAndView mv;
	
	private int listCnt = 99999;//페이지 당 게시글 개수
	
	public ModelAndView getBoardList(Integer pageNum) {
		mv = new ModelAndView();
		
		//null 또는 페이지 번호가 pageNum으로 넘어옴.Infuse
		int num = (pageNum == null)? 1 : pageNum;
		//로그인 후에는 null이 넘어옴.
		
		//게시글 목록 가져오기
		Map<String, Integer> pmap = 
				new HashMap<String, Integer>();
		pmap.put("num", num);
		pmap.put("lcnt", listCnt);
		//차후 view(jsp)에서 페이지 당 글 개수를 입력받아서
		//설정하는 부분을 처리하여 10 대신 사용.
		
		List<review_BoardDto> bList = bDao.getList(pmap);
		
		//화면에 전송.
		mv.addObject("bList", bList);
		
		//페이징 처리.(이건 나중에...)
		String pageHtml = getPaging(num);
		mv.addObject("paging", pageHtml);
		
		//세션에 페이지번호 저장
		//글작성 화면, 글내용 상세보기 화면 등에서 다시 목록으로
		//돌아갈때 보고 있던 페이지가 나오도록 하기 위해.
		session.setAttribute("pageNum", num);
		
		//jsp 파일 이름 지정
		mv.setViewName("board/review_boardList");
		
		return mv;
	}

	private String getPaging(int num) {
		String pageHtml = null;
		
		//전체 글 개수 구하기(DAO)
		int maxNum = bDao.getBoardCnt();
		//한 페이지에 보여질 페이지 번호 개수
		int pageCnt = 10;
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
		
		//multi에서 데이터를 추출(게시글의 텍스트 부분)
		String id = multi.getParameter("bid");
		String title = multi.getParameter("btitle");
		String content = multi.getParameter("bcontents");
		String check = multi.getParameter("fileCheck");
		
		//textarea는 실제 데이터 앞뒤에 공백이 발생하는 경우가 종종 있음.
		content = content.trim();//앞뒤 공백 제거.
		
		//게시글 내용을 dto 담아서 dao로 넘김
		review_BoardDto board = new review_BoardDto();
		board.setBid(id);
		board.setBtitle(title);
		board.setBcontents(content);
		
		try {
			//1. 게시글을 DB(BOARD 테이블)에 저장
			bDao.boardInsert(board);//이 문장 실행 후 bnum에 게시글번호 저장됨.
			
			//2. 업로드 파일이 있을 경우 파일 저장 및 DB(BOARDFILE 테이블)에 저장
			if(check.equals("1")) {
				fileUpload(multi, board.getBnum());
			}
					
			view = "redirect:review_list";//목록의 첫페이지로.
			msg = "글 작성 성공";
		} catch (Exception e) {
			//e.printStackTrace();
			view = "redirect:review_writeFrm";
			msg = "글 작성 실패";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return view;
	}

	private void fileUpload(MultipartHttpServletRequest multi, 
			int bnum) throws Exception {
		//multi는 업로드한 파일을 포함하고 있음.
		//업로드한 파일과 게시물을 bnum으로 연결.
		
		String realPath = session.getServletContext()
				.getRealPath("/");
		
		//파일 저장 경로 추가
		realPath += "WEB-INF/views/upload/";
		
		//폴더가 존재하는 지 확인해서 없을 경우 생성.
		File folder = new File(realPath);
		if(folder.isDirectory() == false) {
			folder.mkdir();
		}
		
		//1. 파일 정보를 DB에 저장(bnum, oriname, sysname)
		Map<String, String> fmap = new HashMap<String, String>();
		fmap.put("bnum", String.valueOf(bnum));
		
		//원래 파일명 구하고, 각 파일별로 sysname을 만들어서 넣기
		//multi에서 file 태그의 name 값 꺼내기
		Iterator<String> files = multi.getFileNames();
		
		while(files.hasNext()) {
			String fn = files.next();//file 태그의 name 값 꺼내기.
			
			//하나의 file input 태그에는 여러 파일이 업로드될 수 있다.
			List<MultipartFile> fList = multi.getFiles(fn);
			
			//각각의 파일을 처리
			for(int i = 0; i < fList.size(); i++) {
				MultipartFile mf = fList.get(i);
				//파일 이름 구하기
				String orname = mf.getOriginalFilename();
				
				//변경할 이름 만들기
				String syname = System.currentTimeMillis()
						+ orname.substring(orname.lastIndexOf("."));
				
				//파일명들을 map에 저장
				fmap.put("oriName", orname);
				fmap.put("sysName", syname);
				
				//폴더에 파일 저장
				File ff = new File(realPath + syname);
				mf.transferTo(ff);
				
				//DB에 파일 정보 저장
				bDao.fileInsert(fmap);
			}
		}
		
	}//method end
	
	public ModelAndView getContents(Integer bnum) {
		mv = new ModelAndView();
		
		//조회수 1 증가
		bDao.viewUpdate(bnum);
		
		//글 내용 가져오기
		review_BoardDto board = bDao.getContents(bnum);
		//파일 목록 가져오기
		List<review_BfileDto> bfList = bDao.getBfList(bnum);
		//댓글 목록 가져오기
		List<review_ReplyDto> rList = bDao.getReList(bnum);
		
		//가져온 데이터 mv에 담기
		mv.addObject("board", board);
		mv.addObject("fList", bfList);
		mv.addObject("rList", rList);
		
		//보여질 페이지(jsp) 이름 지정
		mv.setViewName("board/review_boardContents");
		
		return mv;
	}
	
	public void fileDownload(review_BfileDto bfile, 
			HttpServletResponse res) {
		//이 메소드가 직접 사용자의 컴퓨터로 파일을 전송
		//이 때 response 객체를 사용.
		
		//실제 파일 저장 경로(upload폴더)에서 파일 가져오기
		String realPath = session.getServletContext()
				.getRealPath("/");
		realPath += "WEB-INF/views/upload/";
		
		//파일 이름을 원래 이름으로 변경
		String oName = bfile.getBf_oriname();
		
		realPath += bfile.getBf_sysname();
		
		//서버 폴더에서 파일을 가져오는 통로(stream)
		InputStream is = null;
		//사용자 컴퓨터로 파일을 보내는 통로(stream)
		OutputStream os = null;
		
		try {
			//파일명 인코딩(한글 깨짐 방지)
			String dfName = URLEncoder.encode(oName, "UTF-8");
			
			File file = new File(realPath);
			is = new FileInputStream(file);
			
			//인터넷을 통해 전달하기 위한 설정
			res.setContentType("application/octet-stream");
			res.setHeader("content-Disposition", 
					"attachment; filename=\"" + dfName + "\"");
			//attachment; filename="그림1.png"
			
			//보내는 통로 생성
			os = res.getOutputStream();
			
			//파일 전송(byte 단위로 전송)
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	@Transactional
	public Map<String, List<review_ReplyDto>> replyInsert(review_ReplyDto reply){
		Map<String, List<review_ReplyDto>> rmap = null;
		
		try {
			//댓글 삽입
			bDao.replyInsert(reply);
			
			//댓글 목록 다시 검색
			List<review_ReplyDto> rList = bDao.getReList(reply.getR_bnum());
			
			rmap = new HashMap<String, List<review_ReplyDto>>();
			rmap.put("rList", rList);
		} catch (Exception e) {
			e.printStackTrace();
			rmap = null;
		}
		
		//이 rmap은 boardContents.jsp의 script ajax의 success 함수
		//에 result로 들어감.
		return rmap;
	}

	public ModelAndView updateFrm(int bnum, 
			RedirectAttributes rttr) {
		mv = new ModelAndView();
		
		review_BoardDto board = bDao.getContents(bnum);
		
		MemberDto member = 
				(MemberDto)session.getAttribute("mb");
		
		mv.addObject("board", board);
		List<review_BfileDto> bfList = bDao.getBfList(bnum);
		mv.addObject("bfList", bfList);
		mv.setViewName("board/review_updateFrm");
				
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
		
		
		review_BoardDto board = new review_BoardDto();
		board.setBnum(Integer.parseInt(bnum));
		board.setBtitle(title);
		board.setBcontents(contents);
		board.setBid(id);
		
		try {
			bDao.boardUpdate(board);
			
			//파일 업로드 메소드 호출
			if(check.equals("1")) {
				fileUpload(multi, board.getBnum());
			}
			
			rttr.addFlashAttribute("msg", "수정 성공");
		} catch (Exception e) {
			// TODO: handle exception
			rttr.addFlashAttribute("msg", "수정 실패");
		}
		
		view = "redirect:review_contents?bnum=" + bnum;
		
		return view;
	}
	
	@Transactional
	public Map<String, List<review_BfileDto>> fileDelete(String sysname, int bnum) {
		Map<String, List<review_BfileDto>> rMap = null;
		//절대 경로는 세션으로 구할 수도 있다.
		String path = session.getServletContext()
				.getRealPath("/");
		
		path += "WEB-INF/views/upload/" + sysname;
		
		try {
			bDao.fileDelete(sysname);
			
			File file = new File(path);
			
			if(file.exists()) {
				if(file.delete()) {
					List<review_BfileDto> fList = bDao.getBfList(bnum);
					rMap = new HashMap<String, List<review_BfileDto>>();
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
			//댓글 삭제
			bDao.replyDelete(bnum);
			//파일 삭제
			bDao.filesListDelete(bnum);
			//게시글 삭제
			bDao.boardDelete(bnum);
			
			view = "redirect:review_list";
			rttr.addFlashAttribute("msg", "삭제 성공");
			
		} catch (Exception e) {
			//e.printStackTrace();
			view = "redirect:review_contents?bnum=" + bnum;
			rttr.addFlashAttribute("msg", "삭제 실패");
		}
		
		return view;
	}
}//class end






