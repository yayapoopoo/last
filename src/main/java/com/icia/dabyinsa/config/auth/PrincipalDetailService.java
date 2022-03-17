package com.icia.dabyinsa.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.icia.dabyinsa.user.dao.MemberDao;
import com.icia.dabyinsa.user.dto.MemberDto;

@Service
public class PrincipalDetailService implements UserDetailsService{

	@Autowired
	private MemberDao mDao;
		
	@Override
	public UserDetails loadUserByUsername(String m_id) throws UsernameNotFoundException {
		MemberDto userEntity = mDao.login(m_id);
		System.out.println("userEntity : "+userEntity);
		
		return new PrincipalDetail(userEntity);
	}
	
	
}
