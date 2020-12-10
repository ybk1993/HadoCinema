package com.lec.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.lec.dto.OtherReviewsDTO;
import com.lec.service.RService;



@Controller
public class ReviewCrawlingController {
	
	@Inject
	RService service;

	
	@ResponseBody
	@RequestMapping(value = "crawling.do", method = {RequestMethod.GET, RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String getCrawling() throws Exception {
		Document doc;
		String gson = "";
		String url = "https://movie.naver.com/movie/point/af/list.nhn?&page=1";
		try {
			

			// 영화 리뷰 정보 스크래핑
			 doc = Jsoup.connect(url).get();
			/* Elements */
		     Elements reviewInfo = doc.select(".title");
		     
				List<OtherReviewsDTO> list = new ArrayList<OtherReviewsDTO>();

				for (int i = 0; i < reviewInfo.size(); i++) {
					
					Element reviewInfo_el = reviewInfo.get(i);
					JSONObject obj = new JSONObject();
					String movie = reviewInfo_el.text();

					int a = movie.indexOf("-");
					if(movie != "") {
					String rMovieName2 = movie.substring(0, a-4);
					String reviewGrade2 = movie.substring(a+9,a+11).trim();
					String reviewContent2 = movie.substring(a+12,movie.length()-2).trim();
					OtherReviewsDTO otherReviewsDTO = new OtherReviewsDTO(rMovieName2, reviewContent2, reviewGrade2);
					 
					service.writeReview(otherReviewsDTO); 

					list.add(otherReviewsDTO);
					}
				}
				
			 	gson = new Gson().toJson(list);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return gson;
	}
}
