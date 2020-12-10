package com.lec.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lec.dto.memberDTO;
import com.lec.service.memberService;

//(String)request.getAttribute( "javax.servlet.forward.request_uri" )

//@SessionAttributes({"id", "name"})	//id라는 키로 저장된 attribute는 session객체에 저장되는 애노테이션
@RestController
public class MemRestController {

	private static final String LOGIN = "login";
	
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
    
    @PostMapping("login")
    public void login(Model model, memberDTO dto, HttpServletRequest request) {
    	memberDTO memberdto = memservice.login(dto);
		
    	HttpSession session = request.getSession();
    	session.setAttribute(LOGIN, memberdto.getUserid());

		
    }
    


    
    // 로그아웃 하는 부분
    @PostMapping("logout")
    public void logout(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        
        if (session.getAttribute(LOGIN) != null) {
        	session.removeAttribute(LOGIN);
//        	session.invalidate(); // 세션 초기화
        }

        model.addAttribute("logoutOk", "logoutOk");
    }
}
