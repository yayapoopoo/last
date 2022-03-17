package com.icia.dabyinsa.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.icia.dabyinsa.user.dto.GuestDto;

@Mapper
public interface GuestSearchDao {

	//전체 하객 목록
	List<GuestDto> getGList(String gkeyword, String gkeyword2, String gsearchOption, String gsearchOption2);
	int getGListCount(String gkeyword, String gkeyword2, String gsearchOption, String gsearchOption2);
	int getGSearchListCount(String gkeyword, String gkeyword2, String gsearchOption, String gsearchOption2);
	
	public void guestDelete(String gname);
}
