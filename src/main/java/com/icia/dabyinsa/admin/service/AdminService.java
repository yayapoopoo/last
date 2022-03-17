package com.icia.dabyinsa.admin.service;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.dabyinsa.admin.dao.NewProductDao;
import com.icia.dabyinsa.admin.dao.OrderSearchDao;
import com.icia.dabyinsa.admin.dao.ProductSearchDao;
import com.icia.dabyinsa.admin.dto.delivery.PaymentListDto;
import com.icia.dabyinsa.admin.dto.delivery.ShippedBeginListDto;
import com.icia.dabyinsa.admin.dto.delivery.ShippedCompleteListDto;
import com.icia.dabyinsa.admin.dto.delivery.ShippedEndListDto;
import com.icia.dabyinsa.admin.dto.delivery.ShippedStandbyListDto;
import com.icia.dabyinsa.admin.dto.order.OrderCancelDto;
import com.icia.dabyinsa.admin.dto.order.OrderChangeDto;
import com.icia.dabyinsa.admin.dto.order.OrderListDto;
import com.icia.dabyinsa.admin.dto.order.OrderRefundDto;
import com.icia.dabyinsa.admin.dto.order.OrderReturnsDto;
import com.icia.dabyinsa.admin.dto.product.prodinfoDto;
import com.icia.dabyinsa.admin.dto.product.productlistDto;
import com.icia.dabyinsa.admin.util.PagingUtil;

import lombok.extern.java.Log;

@Log
@Service
public class AdminService {

	@Autowired
	private OrderSearchDao osDao;
	
	@Autowired
	private ProductSearchDao psDao;
	
	@Autowired
	private NewProductDao npDao;

	@Autowired
	private HttpSession session;

	ModelAndView mv;
	
	private int plistCnt = 2;//페이지 당 게시글 개수

	// 전체 주문 목록
	public List<OrderListDto> getOrderList(String keyword, String keyword2, String searchOption, String searchOption2) {

		return osDao.getOList(keyword, keyword2, searchOption, searchOption2);
	}

	public int getOrderListCount(String keyword, String keyword2, String searchOption, String searchOption2) {

		return osDao.getOListCount(keyword, keyword2, searchOption, searchOption2);
	}

	// 취소
	public List<OrderCancelDto> getOrderCList(String keyword, String keyword2, String searchOption,
			String searchOption2) {

		return osDao.getOCList(keyword, keyword2, searchOption, searchOption2);
	}

	public int getOrderCListCount(String keyword, String keyword2, String searchOption, String searchOption2) {

		return osDao.getOCListCount(keyword, keyword2, searchOption, searchOption2);
	}

	// 교환
	public List<OrderChangeDto> getOrderCGList(String keyword, String keyword2, String searchOption,
			String searchOption2) {

		return osDao.getOCGList(keyword, keyword2, searchOption, searchOption2);
	}

	public int getOrderCGListCount(String keyword, String keyword2, String searchOption, String searchOption2) {

		return osDao.getOCGListCount(keyword, keyword2, searchOption, searchOption2);
	}

	// 환불
	public List<OrderRefundDto> getOrderRList(String keyword, String keyword2, String searchOption,
			String searchOption2) {

		return osDao.getORList(keyword, keyword2, searchOption, searchOption2);
	}

	public int getOrderRListCount(String keyword, String keyword2, String searchOption, String searchOption2) {

		return osDao.getORListCount(keyword, keyword2, searchOption, searchOption2);
	}

	// 반품
	public List<OrderReturnsDto> getOrderRTList(String keyword, String keyword2, String searchOption,
			String searchOption2) {

		return osDao.getORTList(keyword, keyword2, searchOption, searchOption2);
	}

	public int getOrderRTListCount(String keyword, String keyword2, String searchOption, String searchOption2) {

		return osDao.getORTListCount(keyword, keyword2, searchOption, searchOption2);
	}

	// 입금전
	public List<PaymentListDto> getPList(String keyword, String keyword2, String searchOption,
			String searchOption2) {

		return osDao.getPList(keyword, keyword2, searchOption, searchOption2);
	}

	public int getPListCount(String keyword, String keyword2, String searchOption, String searchOption2) {

		return osDao.getPListCount(keyword, keyword2, searchOption, searchOption2);
	}
	
	// 배송준비중
	public List<ShippedBeginListDto> getSBList(String keyword, String keyword2, String searchOption,
			String searchOption2) {

		return osDao.getSBList(keyword, keyword2, searchOption, searchOption2);
	}

	public int getSBListCount(String keyword, String keyword2, String searchOption, String searchOption2) {

		return osDao.getSBListCount(keyword, keyword2, searchOption, searchOption2);
	}
	
	// 배송대기
	public List<ShippedStandbyListDto> getSSList(String keyword, String keyword2, String searchOption,
			String searchOption2) {

		return osDao.getSSList(keyword, keyword2, searchOption, searchOption2);
	}

	public int getSSListCount(String keyword, String keyword2, String searchOption, String searchOption2) {

		return osDao.getSSListCount(keyword, keyword2, searchOption, searchOption2);
	}
	
	// 배송중
	public List<ShippedEndListDto> getSEList(String keyword, String keyword2, String searchOption,
			String searchOption2) {

		return osDao.getSEList(keyword, keyword2, searchOption, searchOption2);
	}

	public int getSEListCount(String keyword, String keyword2, String searchOption, String searchOption2) {

		return osDao.getSEListCount(keyword, keyword2, searchOption, searchOption2);
	}
	
	// 배송완료
	public List<ShippedCompleteListDto> getSCList(String keyword, String keyword2, String searchOption,
			String searchOption2) {

		return osDao.getSCList(keyword, keyword2, searchOption, searchOption2);
	}

	public int getSCListCount(String keyword, String keyword2, String searchOption, String searchOption2) {

		return osDao.getSCListCount(keyword, keyword2, searchOption, searchOption2);
	}
	
	//상품 목록
	public List<productlistDto> getPLList(String plkeyword, String plkeyword2, String plsearchOption, String plsearchOption2) {

		return psDao.getPLList(plkeyword, plkeyword2, plsearchOption, plsearchOption2);
	}
	public int getPLListCount(String plkeyword, String plkeyword2, String plsearchOption, String plsearchOption2) {
		return psDao.getPLListCount(plkeyword, plkeyword2, plsearchOption, plsearchOption2);
	}
	
	//상품 등록
	@Transactional
	public String NewProduct(prodinfoDto pi, 
			RedirectAttributes rttr, MultipartHttpServletRequest multi) {
		log.info("NewProduct()");
		String view = null;
		String msg = null;
		String check = multi.getParameter("fileCheck");

		//내용을 dto 담아서 dao로 넘김
		prodinfoDto board = new prodinfoDto();
		
		try {
		
			if(check.equals("1")) {
				fileUpload(multi, board.getProd_id());
			}
			npDao.NewProduct(pi);
				
			view = "redirect:/";
			msg = "등록 성공 ";
		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:newproduct";
			msg = "등록 실패";
		}

		rttr.addFlashAttribute("msg", msg);
		
		return view;
	}
	
	//중복체크 
	public String Check(String ck) {
		String res = null;
		
		//코드를 검색하여 중복된 코드가 있으면 1,
		//없으면 0이 넘어옴.
		int cnt = npDao.Check(ck);
		if(cnt == 0) {
			res = "ok";
		}
		else {
			res = "fail";
		}
		
		return res;
	}
	
	
	
	
	
	
	//상품 이미지등록
	public void fileUpload(MultipartHttpServletRequest multi, 
			String Prod_id) throws Exception {
		//multi는 업로드한 파일을 포함하고 있음.
		//업로드한 파일과 게시물을 bnum으로 연결.
		log.info("fileUpload()");
		String realPath = session.getServletContext()
				.getRealPath("/");
		
		//파일 저장 경로 추가
		realPath = realPath.substring(0, realPath.lastIndexOf("webapp")) + "resources/static/product/";
		log.info(realPath);
		
		//폴더가 존재하는 지 확인해서 없을 경우 생성.
		File folder = new File(realPath);
		if(folder.isDirectory() == false) {
			folder.mkdir();
		}
		
		//1. 파일 정보를 DB에 저장(bnum, oriname, sysname)
		Map<String, String> fmap = new HashMap<String, String>();
		fmap.put("Prod_id", String.valueOf(Prod_id));
		
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
				npDao.fileInsert(fmap);
			}
		}
		
	}//method end
	
	
	//상품목록 페이징처리
	public ModelAndView getSearchList(Integer pageNum) {
		mv = new ModelAndView();
		
		//null 또는 페이지 번호가 pageNum으로 넘어옴.
		int num = (pageNum == null)? 1 : pageNum;
		//로그인 후에는 null이 넘어옴.
		
		//게시글 목록 가져오기
		Map<String, Integer> plmap = 
				new HashMap<String, Integer>();
		plmap.put("num", num);
		plmap.put("lcnt", plistCnt);
		//차후 view(jsp)에서 페이지 당 글 개수를 입력받아서
		//설정하는 부분을 처리하여 10 대신 사용.
		
		List<productlistDto> bList = psDao.getLLList(plmap);
		
		//화면에 전송.
		mv.addObject("bList", bList);
		
		//페이징 처리
		String pageHtml = getSearchListPaging(num);
		mv.addObject("paging", pageHtml);
		
		//세션에 페이지번호 저장
		//글작성 화면, 글내용 상세보기 화면 등에서 다시 목록으로
		//돌아갈때 보고 있던 페이지가 나오도록 하기 위해.
		session.setAttribute("pageNum", num);
		
		//jsp 파일 이름 지정
		mv.setViewName("productList");
		
		return mv;
	}
	

	private String getSearchListPaging(int num) {
		String pageHtml = null;
		
		//전체 글 개수 구하기(DAO)
		int maxNum = psDao.getpBoardCnt();
		//한 페이지에 보여질 페이지 번호 개수
		int pageCnt = 4;
		String listName = "list";
		
		PagingUtil paging = new PagingUtil(maxNum, num, plistCnt, 
				pageCnt, listName);
		
		pageHtml = paging.makePaging();
		
		return pageHtml;
	}

	
	
}
