package com.lec.controller;



import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.dto.PageMaker;
import com.lec.dto.ReviewDTO;
import com.lec.service.ReviewService;

import com.lec.dto.SearchCriteria;

@Controller
public class ReviewController {

	
	@Inject
	ReviewService service;

	
	// 게시판 글 작성 화면 , review - writeReview.jsp
	
	@RequestMapping(value = "/review/writeReview", method = RequestMethod.GET)
	public void writeReview() throws Exception{
		
	}
	
	// 게시판 글 작성 화면 , review - writeReview.jsp
	
	@RequestMapping(value = "/review/reviewLists2", method = RequestMethod.GET)
	public void writeReview2() throws Exception{
		
	}
	@RequestMapping(value = "/review/reviewLists3", method = RequestMethod.GET)
	public void writeReview3() throws Exception{
		
	}
	
	// 게시판 글 작성
	
	@RequestMapping(value = "/review/writeReviewOk", method = RequestMethod.POST)
	public String writeReviewOk(ReviewDTO reviewDTO) throws Exception{
		
		service.writeReview(reviewDTO);
		
		return "redirect:/review/reviewLists";
	}
	
	

	// 게시판 목록 조회
	@RequestMapping(value =  "/review/reviewLists", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return  "/review/reviewLists";
		
	}
	

	

}	

