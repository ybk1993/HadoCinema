package com.lec.service;


import org.json.simple.JSONObject;

import com.lec.dto.OtherReviewsDTO;





public interface RService {

	public JSONObject exchange() throws Exception;
	
	// 게시글 작성
	public void writeReview(OtherReviewsDTO otherReviewsDTO) throws Exception;

}
