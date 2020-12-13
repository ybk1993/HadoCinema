package com.lec.controller;




import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.service.RStatisticsService;

@Controller
public class RSController {

	
	@Inject
	RStatisticsService service;

	
	// 구글 차트 api
	
	@RequestMapping(value = "/review/rStatistics", method = RequestMethod.GET)
	public void viewRS() throws Exception{
		
	}
	
	


}	

