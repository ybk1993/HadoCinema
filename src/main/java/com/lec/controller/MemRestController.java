package com.lec.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.servlet.ModelAndView;

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
        
        if(memberdto.getUserid().equals("admin")) {
        	session.setAttribute(LOGIN, memberdto.getUserid());
        }else {
        	String strDate = null;
        	SimpleDateFormat tranSimpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.ENGLISH);
        	strDate = tranSimpleFormat.format(memberdto.getSignupdate());
        	
        	session.setAttribute(LOGIN, memberdto.getUserid());
        	session.setAttribute("name", memberdto.getName());
        	session.setAttribute("email", memberdto.getEmail());
        	session.setAttribute("phone", memberdto.getPhone());
        	session.setAttribute("zipcode", memberdto.getZipcode());
        	session.setAttribute("add1", memberdto.getAddress1());
        	session.setAttribute("add2", memberdto.getAddress2());
        	session.setAttribute("signupdate", strDate);
        	session.setAttribute("status", memberdto.getStatus());
        	
        }
		
    }
    

    @PostMapping("/update")
    public void update(memberDTO dto, Model model) {
    	System.out.println("update");
    	memservice.register(dto);
    	
    }

    
    // 로그아웃 하는 부분
    @GetMapping("logout")
    public ModelAndView logout(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        
        if (session.getAttribute(LOGIN) != null) {
        	session.invalidate(); // 세션 초기화
        }
        ModelAndView mav = new ModelAndView("main/main"); //main/main.jsp를 뿌려준다.
        mav.setViewName("redirect:/main");	// url 경로 /main으로 변경 안하면 /logout
        return mav;
    }
}
