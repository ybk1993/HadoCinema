package com.lec.controller;



import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lec.dto.OtherReviewsDTO;
import com.lec.service.RService;

@Controller
public class RController {

	
	@Inject
	RService service;

	// 게시판 글 작성
	
	@RequestMapping(value = "/review/writeOR", method = RequestMethod.POST)
	public String writeReviewOk(OtherReviewsDTO otherReviewsDTO) throws Exception{
		
		service.writeReview(otherReviewsDTO); 
		
		return "redirect:/review/reviewLists";
	}


	@GetMapping("sendExchange")
	@ResponseBody
	@CrossOrigin
	public JSONObject sendExchange() throws Exception {
		
		JSONObject j = service.exchange();

		JSONArray arr = (JSONArray) j.get("reviews");
		
		System.out.println(arr.get(0));
		
		JSONObject m = (JSONObject) arr.get(0);
		
		String reviewContent2 = (String) m.get("reviewContent2");
		String rMovieName2 = (String) m.get("rMovieName2");
		String reviewGrade2 = (String) m.get("reviewGrade2");
		OtherReviewsDTO otherReviewsDTO = new OtherReviewsDTO(reviewContent2 , rMovieName2, reviewGrade2);
		
		writeReviewOk(otherReviewsDTO);
		
		return j;

	}

}	

