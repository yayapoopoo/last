package com.icia.dabyinsa.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.dabyinsa.admin.dao.MemberSearchDao;
import com.icia.dabyinsa.user.dto.MemberDto;


@Service
public class MemberInfoService {

	@Autowired
	private MemberSearchDao mDao;
	
	public MemberDto memInfo(String m_id) {
		System.out.println(m_id);
		System.out.println(mDao.memInfo(m_id));
		return mDao.memInfo(m_id);
	}
	
}
