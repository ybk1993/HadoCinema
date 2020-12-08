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
		
		return "redirect:/mypage/readView";
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
	
	/*
	// 게시판 조회, mypage - qandaView.jsp
	
	@RequestMapping(value = "/mypage/qandaView", method = RequestMethod.GET)
	public String read(CsDTO csDTO, Model model) throws Exception{
		
		model.addAttribute("read", service.read(csDTO.getCs_uid()));
				
		return "/mypage/qandaView";
	}
	
	*/
}	

	/*
	// 게시판 목록 조회 , mypage - qandaList.jsp
	
	@RequestMapping(value = "/mypage/qandaList", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/mypage/qandaList";
		
	}
	
	
	// 게시판 조회, mypage - qandaView.jsp
	
	@RequestMapping(value = "/mypage/qandaView", method = RequestMethod.GET)
	public String read(CsDTO csDTO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		
		model.addAttribute("read", service.read(csDTO.getCs_uid()));
		model.addAttribute("scri", scri);
		
		List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
		model.addAttribute("replyList", replyList);
		
		return "/mypage/qandaView";
	}
	
	// 게시판 수정뷰, mypage - qandaUpdate.jsp
	
	@RequestMapping(value = "/mypage/qandaUpdate", method = RequestMethod.GET)
	public String updateView(CsDTO csDTO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		
		model.addAttribute("update", service.read(csDTO.getCs_uid()));
		model.addAttribute("scri", scri);
		
		return "/mypage/qandaUpdate";
	}
	// 게시판 수정
	@RequestMapping(value = "/mypage/updateQ", method = RequestMethod.POST)
	public String update(CsDTO csDTO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		
		service.update(csDTO);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/mypage/qandaList";
	}
	
	// 게시판 삭제
	@RequestMapping(value = "/mypage/deleteQ", method = RequestMethod.POST)
	public String delete(CsDTO csDTO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		
		service.delete(csDTO.getCs_uid());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/mypage/qandaList";
	}
	*/




