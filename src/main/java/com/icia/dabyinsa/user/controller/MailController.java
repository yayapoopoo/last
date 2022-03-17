package com.icia.dabyinsa.user.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.dabyinsa.user.dto.MemberDto;
import com.icia.dabyinsa.user.service.MailService;



@Controller
public class MailController {

    @Autowired
    private MailService mailServ;
    
 
    
    @GetMapping("findPw")
    public String sendMail(MemberDto mDto, RedirectAttributes rttr) {
         String view = mailServ.findPwIdCheck(mDto, rttr);
        
        return view;
    }
}