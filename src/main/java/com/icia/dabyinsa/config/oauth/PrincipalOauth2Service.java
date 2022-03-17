package com.icia.dabyinsa.config.oauth;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.icia.dabyinsa.config.auth.PrincipalDetail;
import com.icia.dabyinsa.config.oauth.provider.GoogleUserInfo;
import com.icia.dabyinsa.config.oauth.provider.KaKaoUserInfo;
import com.icia.dabyinsa.config.oauth.provider.NaverUserInfo;
import com.icia.dabyinsa.config.oauth.provider.OAuth2UserInfo;
import com.icia.dabyinsa.user.dao.MemberDao;
import com.icia.dabyinsa.user.dto.MemberDto;

@Service
public class PrincipalOauth2Service extends DefaultOAuth2UserService{
	
	
	@Autowired
	private MemberDao mDao;
	
	// 구글로 부터 받은 userRequest 데이터 후처리 함수 
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		
		System.out.println("Registration: " + userRequest.getClientRegistration());
		System.out.println("Token: " + userRequest.getAccessToken());
		
		
		OAuth2User oauth2User = super.loadUser(userRequest);
		OAuth2UserInfo oAuth2UserInfo = null;
		System.out.println("Attributes: " + oauth2User.getAttributes());
		
		if(userRequest.getClientRegistration().getRegistrationId().equals("google")) {
			System.out.println("구글 로그인 요청");
			 oAuth2UserInfo = new GoogleUserInfo(oauth2User.getAttributes());
		}
		else if(userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
			System.out.println("네이버 로그인 요청");
			oAuth2UserInfo = new NaverUserInfo((Map)oauth2User.getAttributes().get("response"));
		}
		else if(userRequest.getClientRegistration().getRegistrationId().equals("kakao")) {
			System.out.println("카카오 로그인 요청");
			oAuth2UserInfo = new KaKaoUserInfo(oauth2User.getAttributes());
		}
		
		else {
			System.out.println("우리는 구글, 네이버, 카카오만 지원해요");
		}
		
		String provider = userRequest.getClientRegistration().getRegistrationId(); //google
		String providerId = oAuth2UserInfo.getProviderId();
		String m_id = provider+"_"+providerId;
		String m_pass = "$2a$10$8P1nlCF6b4mhAy4SKGxvY.GPEl5T5KuKOEto0m4tP0JbWiCOb7R1S"; 
		String email = oAuth2UserInfo.getEmail();
		String m_role = "ROLE_USER";
		String m_phone = "01012341234";
		
	
		 MemberDto mDto = mDao.login(m_id);
		 
		 if(mDto == null) {
			 mDto = MemberDto.builder()
					 .m_id(m_id)
					 .m_pass(m_pass)
					 .m_name(m_id)
					 .m_phone(m_phone)
					 .m_email(email)
					 .m_role(m_role)
					 .m_grade(m_role)
					 .m_provider(provider)
					 .m_providerId(providerId)
					 .build();
			 
			 mDao.memberInsert(mDto);
			 
			
		 }else {
			 System.out.println("로그인을 이미 한적이 있습니다.");
		 }
		
		
		
		return new PrincipalDetail(mDto, oauth2User.getAttributes());
	}

}
