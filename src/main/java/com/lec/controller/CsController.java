package com.lec.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.dto.Criteria;
import com.lec.dto.CsDTO;
import com.lec.dto.PageMaker;
import com.lec.dto.ReviewDTO;
import com.lec.service.CsService;

@Controller
public class CsController {

	
	@Inject
	CsService service;

	
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

	// 게시판 목록 조회
	@RequestMapping(value = "/mypage/qandaList", method = RequestMethod.GET)
	public String list(Model model, Criteria cri) throws Exception{
		
		model.addAttribute("list", service.list(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/mypage/qandaList";
		
	}
	
	// 게시판 조회
	@RequestMapping(value = "/mypage/qandaView", method = RequestMethod.GET)
	public String read(CsDTO csDTO, Model model) throws Exception{
		
		model.addAttribute("read", service.read(csDTO.getCs_uid()));
		return "/mypage/qandaView";
	}
}
	

