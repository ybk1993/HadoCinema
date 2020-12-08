package com.lec.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;


import com.lec.dto.memberDTO;
import com.lec.service.memberService;

//(String)request.getAttribute( "javax.servlet.forward.request_uri" )

@RestController
public class MemRestController {

	@Autowired
	memberService memservice;
	
	private static final Logger logger = LoggerFactory.getLogger(MemRestController.class);
    @GetMapping("/list")
    public List<memberDTO> allMember(memberDTO dto) {
        return memservice.allMember(dto);
    }
 
    @GetMapping("member/{userid}")
    public String getMemUserid(@PathVariable("userid") String id, Model model) {
    	logger.info("getMemUserid 진입");
    	boolean getId = memservice.getMemUserid(id);
//    	System.out.println(getId);
    	model.addAttribute("chkId", getId);
    	
    	return getId + "";
    	
    }
 
    @PostMapping("/register")
    public boolean register(memberDTO dto, Model model) {
    	logger.info("register 진입");
    	boolean registerOk = memservice.register(dto);
    	
        return registerOk;
    }
    
    @GetMapping("login/${userid}")
    public String login(Model model, @PathVariable("userid") String id, HttpSession session) {
		String loginId = memservice.login(id);
		if(loginId != null) {
			model.addAttribute("isSuccess", true);
			model.addAttribute("loginId", loginId);
			session.setAttribute("login", loginId);
		}else {
			model.addAttribute("isSuccess", false);
		}
		
		return "memberdto";
    }
    
    // 로그아웃 하는 부분
    @GetMapping("logout")
    public void logout(Model model, HttpSession session) {
        session.invalidate(); // 세션 초기화
        
        model.addAttribute("logoutOk", "logoutOk");
    }
}
