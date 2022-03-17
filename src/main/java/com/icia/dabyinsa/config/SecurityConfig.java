package com.icia.dabyinsa.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.icia.dabyinsa.config.auth.PrincipalDetailService;
import com.icia.dabyinsa.config.oauth.PrincipalOauth2Service;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private PrincipalOauth2Service principalOauth2Service;
	
	@Autowired
	private PrincipalDetailService principalDetailService;
	
	@Autowired
	private CustomFailureHandler customFailureHandler;
	
	@Bean
	@Override
	protected AuthenticationManager authenticationManager() throws Exception {
		return super.authenticationManager();
	}
	
	@Bean // IoC가 됨. (비밀번호 해쉬)
	public BCryptPasswordEncoder encordPWD() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(principalDetailService).passwordEncoder(encordPWD());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
				.headers()
				.frameOptions().disable()
				.and()
				.csrf().disable()
				.authorizeRequests()
				// .antMatchers("/", "/admin/**", "/common/**", "/guest/**", "/user/**",
				// "/main")
				.antMatchers("/**")
				.permitAll()
				.anyRequest()
				.authenticated()
				.and()
				.formLogin()
				.loginPage("/loginForm")
				.loginProcessingUrl("/loginProc")
				.defaultSuccessUrl("/")
				.failureForwardUrl("/loginForm")
				.usernameParameter("m_id")
				.passwordParameter("m_pass")
				.failureHandler(customFailureHandler)
				.and()
				.logout()
				.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
				.logoutSuccessUrl("/loginForm")
				.invalidateHttpSession(true)
				.and()
				.oauth2Login()
				.loginPage("/loginForm")
				.userInfoEndpoint()
				.userService(principalOauth2Service);
				
				
	}
}
