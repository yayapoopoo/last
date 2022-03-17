package com.icia.dabyinsa.config.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.icia.dabyinsa.user.dto.MemberDto;

import lombok.Data;

@Data
public class PrincipalDetail implements UserDetails, OAuth2User{

	private static final long serialVersionUID = 1L;
	private MemberDto user; // 콤포지션
	private Map<String, Object> attributes;
	
	//일반 로그인
	public PrincipalDetail(MemberDto user) {
		this.user=user;
	}
	
	// OAuth 로그인
	public PrincipalDetail(MemberDto user, Map<String, Object> attributes) {
		this.user=user;
		this.attributes=attributes;
	}
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
//		Collection<GrantedAuthority> collertors = new ArrayList<GrantedAuthority>();
//		collertors.add(()->{ return "ROLE_"+user.getM_role();});
//		
//		return collertors;
		Collection<GrantedAuthority> authorities = new ArrayList<>();

		  for(String role : user.getM_role().split(",")){
		    authorities.add(new SimpleGrantedAuthority(role));
		  }
		  return authorities;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return user.getM_pass();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return user.getM_id();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
	@Override
	public Map<String, Object> getAttributes() {
		
		return attributes;
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return null;
	}

}
