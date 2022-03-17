package com.icia.dabyinsa.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.icia.dabyinsa.user.dto.MemberDto;

@Mapper
public interface MemberSearchDao {
	
	// 전체 고객 목록
	List<MemberDto> getMAList(String mkeyword, String mkeyword2, String msearchOption, String msearchOption2);
	int getMAListCount(String mkeyword, String mkeyword2, String msearchOption, String msearchOption2);
	int getMSearchListCount(String mkeyword, String mkeyword2, String msearchOption, String msearchOption2);

	public void memberDelete(String m_id);
	
	public MemberDto memInfo(String m_id);
	

}
