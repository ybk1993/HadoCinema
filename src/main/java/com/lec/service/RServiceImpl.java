package com.lec.service;


import java.io.IOException;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.lec.dao.RDAO;
import com.lec.dto.OtherReviewsDTO;





@Service
public class RServiceImpl implements RService {
	@Inject
	private RDAO dao;
	

	// 게시글 작성
	@Override
	public void writeReview(OtherReviewsDTO otherReviewsDTO) throws Exception {
		dao.writeReview(otherReviewsDTO);
	}

	
	public JSONObject exchange() throws Exception {
		JSONObject result = new JSONObject();
		JSONArray arr = new JSONArray();

		// 네이버 영화리뷰
		int m = 1;
		String url = "https://movie.naver.com/movie/point/af/list.nhn?&page="+m;
		Document doc = null;
		
		for(m=1;m<10;m++) {

		try {
			// 영화 리뷰 정보 스크래핑
			doc = Jsoup.connect(url).get();
			// 국가명, 환율
			Elements reviewInfo = doc.select(".title");

			for (int i = 0; i < reviewInfo.size(); i++) {
				
				Element reviewInfo_el = reviewInfo.get(i);
				JSONObject obj = new JSONObject();
				String movie = reviewInfo_el.text();

				int a = movie.indexOf("-");
				
				String rMovieName2 = movie.substring(0, a-4);
				String reviewGrade2 = movie.substring(a+9,a+11).trim();
				String reviewContent2 = movie.substring(a+12,movie.length()-2).trim();
				obj.put("reviewContent2", reviewContent2);
				obj.put("reviewGrade2", reviewGrade2);
				obj.put("rMovieName2", rMovieName2);



			}
			result.put("result", "success");
			result.put("reviews", arr);
			

		} catch (IOException e) {

			result.put("result", "fail");
			e.printStackTrace();

		}

	}
		return result;                                                                                                                                                                                       

	}
}

