package com.icia.dabyinsa.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.icia.dabyinsa.user.dto.MemberDto;
import com.icia.dabyinsa.user.dto.OrderDto;

@Mapper
public interface MemberDao {
	
	public MemberDto login(String m_id); 
	
	public void memberInsert(MemberDto member);
	
	public int idCheck(String id);
	
	public int orderBefore(int number);
	
	public int payment(int number);
	
	public void memberUpdate(String id, String phone);
	
	public void emailUpdate(String id, String email);
	
	public void passUpdate(MemberDto member);
	
	public void memberDelete(String id);
	
	public String SearchId(String m_email);
	
	public String findMemberId(String m_name, String m_email);
	

    public int emailCheck(String m_email);
    
    public List<OrderDto> opStatus(String id);
    
    
    

}
