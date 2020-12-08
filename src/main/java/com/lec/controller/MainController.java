package com.lec.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.dto.memberDTO;
import com.lec.service.memberService;

@Controller
public class MainController {
	
	
	@RequestMapping("/main")
	public String main() {
		
		return "main/main";
	}

	@RequestMapping("/memTest")
	public void memTest() {}
	
	@RequestMapping("/testheader")
	public String testheader() {
		return "main/testheader";
	}
	
	
}
