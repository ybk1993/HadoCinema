package com.lec.controller;



import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.dto.PageMaker;
import com.lec.service.ReviewService2;
import com.lec.dto.SearchCriteria;

@Controller
public class Review2Controller {

	
	@Inject
	ReviewService2 service;

	

	
	

	// 게시판 목록 조회
	@RequestMapping(value =  "/review/reviewLists2", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return  "/review/reviewLists2";
		
	}
	

	

}	

