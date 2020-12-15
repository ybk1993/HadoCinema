package com.lec.controller;


import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.dto.Criteria;
import com.lec.dto.CsDTO;
import com.lec.dto.PageMaker;
import com.lec.service.CsService;

@Controller
public class CsController {

	
	@Inject
	CsService service;
	
	 @Autowired
	 private JavaMailSender mailSender;
	
	// 게시판 글 작성 화면 , cs - qanda.jsp
	
	@RequestMapping(value = "/cs/qanda", method = RequestMethod.GET)
	public void writeView() throws Exception{
		
	}
	
	// 게시판 글 작성
	
	@RequestMapping(value = "/cs/writeQanda", method = RequestMethod.POST)
	public String write(CsDTO csDTO) throws Exception{
		
		service.write(csDTO);
		
		return "redirect:/mypage/qandaList";
	}


	//문의게시판 글 목록 [관리자]
	@RequestMapping(value = "/mypage/qandaList", method = RequestMethod.GET)
	public String list(Model model, Criteria cri) throws Exception{
		
		model.addAttribute("list", service.list(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/mypage/qandaList";
		
	}
	
	// 문의게시판 조회
	@RequestMapping(value = "/mypage/qandaView", method = RequestMethod.GET)
	public String read(CsDTO csDTO, Model model) throws Exception{
		
		model.addAttribute("read", service.read(csDTO.getCs_uid()));
		return "/mypage/qandaView";
	}
	
	
	//문의게시판 글 목록 [관리자]
	@RequestMapping(value = "/mypage/qandaList2", method = RequestMethod.GET)
	public String listA(Model model, Criteria cri) throws Exception{
		
		model.addAttribute("list", service.list(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/mypage/qandaList2";
		
	}
	// 문의게시판 글 조회 [관리자]
	@RequestMapping(value = "/mypage/qandaView2", method = RequestMethod.GET)
	public String answer(CsDTO csDTO, Model model) throws Exception{
		
		model.addAttribute("read", service.read(csDTO.getCs_uid()));
		return "/mypage/qandaView2";
	}
	
	// 게시판 글 작성/mypage/answerOk [관리자]
	
	@RequestMapping(value = "/mypage/answerOk", method = RequestMethod.POST)
	public String answerOk(CsDTO csDTO) throws Exception{
		
		service.answer(csDTO);
		
		  
		   String setfrom = "hd04mail@gmail.com";         
		   String tomail  = csDTO.getCs_memid();   // 받는 사람 이메일
		   String title   = "해도시네마에서 문의 답변 보내드립니다.";      // 제목
		   String answer = csDTO.getCs_answer();
		   String content = csDTO.getCs_subject() + "\r\n" + csDTO.getCs_content()+ "\r\n==========답변==========\r\n"+ answer ;	
		   
		   
		   try {
			     MimeMessage message = mailSender.createMimeMessage();
			     MimeMessageHelper messageHelper 
			                       = new MimeMessageHelper(message, true, "UTF-8");

			     messageHelper.setFrom(setfrom);  // 보내는사람 이메일
			     messageHelper.setTo(tomail);     // 받는사람 이메일
			     messageHelper.setSubject(title); 
			     messageHelper.setText(content);  // 메일 내용
			    
			     mailSender.send(message);
			   } catch(Exception e){
			     System.out.println(e);
			   }
		return "redirect:/mypage/qandaList2";
	}
	
}
	

