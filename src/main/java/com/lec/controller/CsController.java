package com.lec.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lec.dto.CsDTO;
import com.lec.service.CsService;

@Controller
@RequestMapping("/cs/*")
public class CsController {

	private static final Logger logger = LoggerFactory.getLogger(CsController.class);
	
	@Inject
	CsService service;

	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/qanda", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("qanda");
		
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/writeQanda", method = RequestMethod.POST)
	public String write(CsDTO csDTO) throws Exception{
		logger.info("writeQanda");
		
		service.write(csDTO);
		
		return "redirect:/cs/qanda";
	}
	


}











