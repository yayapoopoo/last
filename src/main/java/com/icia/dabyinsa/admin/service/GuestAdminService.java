package com.icia.dabyinsa.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icia.dabyinsa.admin.dao.GuestSearchDao;
import com.icia.dabyinsa.user.dto.GuestDto;

import lombok.extern.java.Log;

@Service
@Log
public class GuestAdminService {
	
	@Autowired
	private GuestSearchDao gsDao;
	
	
	//전체 하객 목록
	public List<GuestDto> getGuestList(String gkeyword, String gkeyword2, String gsearchOption, String gsearchOption2) {		
		return gsDao.getGList(gkeyword, gkeyword2, gsearchOption, gsearchOption2);
	}
	
	//전체 하객 수
	public int getGListCount(String gkeyword, String gkeyword2, String gsearchOption, String gsearchOption2) {	
		return gsDao.getGListCount(gkeyword, gkeyword2, gsearchOption, gsearchOption2);
	}
	
	//검색 고객 수
	public int getGSearchListCount(String gkeyword, String gkeyword2, String gsearchOption, String gsearchOption2) {	
		return gsDao.getGSearchListCount(gkeyword, gkeyword2, gsearchOption, gsearchOption2);
	}
	
	//선택 고객 삭제
	@Transactional
	public void delete(String gname) {
		log.info("delete()");
		System.out.println("m_id : "+gname);
		gsDao.guestDelete(gname);
	}
	
}
