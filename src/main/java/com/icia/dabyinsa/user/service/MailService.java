package com.icia.dabyinsa.user.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.dabyinsa.user.dao.MemberDao;
import com.icia.dabyinsa.user.dto.MailDto;
import com.icia.dabyinsa.user.dto.MemberDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MailService {
    
    private final JavaMailSender javaMailSender;
    
    @Autowired
    MemberDao mDao;
    
    public void sendMail(MailDto mailDto) {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
            mimeMessageHelper.setFrom("");
            mimeMessageHelper.setTo(mailDto.getTo()); //메일 수신자
            mimeMessageHelper.setSubject(mailDto.getSubject());
            mimeMessageHelper.setText(mailDto.getMessage(), true);
            javaMailSender.send(mimeMessage);
            log.info("Success");
        } catch (Exception e) {
            log.info("fail");
            throw new RuntimeException(e);
        }
    }
    
    public String findPwIdCheck(MemberDto mDto, RedirectAttributes rttr) {
        String view = null;
        String msg = null;
        MemberDto ck = mDao.login(mDto.getM_id());
        
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        
        
        
        if(mDao.idCheck(mDto.getM_id()) == 0) {
            
            msg = "등록되지 않은 아이디입니다.";
            
            view = "redirect:findPwPage";
        }
        
        else if (!mDto.getM_email().equals(ck.getM_email())) {
            
            msg = "등록되지 않은 이메일입니다.";
            
            view = "redirect:findPwPage";
        }
        
        else {
            
            String pw = "";
            
            for(int i = 0; i < 12; i++) {
                
                pw += (char) ((Math.random() * 26) + 97);
            }
            
            MailDto mailDto = MailDto.builder()
                     .to(mDto.getM_email())
                     .subject("답인사 임시비밀번호 입니다.")
                     .message(mDto.getM_id() + "님의 임시 비밀번호 : " + pw + "<br>" + "로그인 후 비밀번호를 변경해주세요." + "<br>" + "<a href= http://localhost/loginForm>[로그인 하러가기]</a>")
                     .build();
             
            sendMail(mailDto);            
            
            String encPassword = encoder.encode(pw);
            mDto.setM_pass(encPassword);
            
            mDao.passUpdate(mDto);
            
            msg = "이메일로 임시 비밀번호를 발송하였습니다.";
            
            view = "redirect:loginForm";
            
            
            
        }
        
        rttr.addFlashAttribute("msg", msg);
        
        
        
        return view;
    }

}