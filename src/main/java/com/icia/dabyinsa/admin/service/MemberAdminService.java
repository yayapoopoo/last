package com.icia.dabyinsa.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.dabyinsa.admin.dao.MemberSearchDao;
import com.icia.dabyinsa.user.dao.MemberDao;
import com.icia.dabyinsa.user.dto.MemberDto;

@Service
public class MemberAdminService {
	
	@Autowired
	private MemberSearchDao msDao;	
	
	//전체 고객 목록
	public List<MemberDto> getMemberList(String mkeyword, String mkeyword2, String msearchOption, String msearchOption2) {	
		return msDao.getMAList(mkeyword, mkeyword2, msearchOption, msearchOption2);
	}
	
	//전체 고객 수
	public int getMemberListCount(String mkeyword, String mkeyword2, String msearchOption, String msearchOption2) {	
		return msDao.getMAListCount(mkeyword, mkeyword2, msearchOption, msearchOption2);
	}
	
	//검색 고객 수
	public int getMemberSeachListCount(String mkeyword, String mkeyword2, String msearchOption, String msearchOption2) {	
		return msDao.getMSearchListCount(mkeyword, mkeyword2, msearchOption, msearchOption2);
	}
	
	//선택 고객 삭제
	public void delete(String m_id) {
		System.out.println("m_id : "+m_id);
		msDao.memberDelete(m_id);
	}
	
	

}
	
