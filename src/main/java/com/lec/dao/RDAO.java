package com.lec.dao;



import org.json.simple.JSONObject;

import com.lec.dto.OtherReviewsDTO;




public interface RDAO {

	// 게시글 작성
	public void exchange(OtherReviewsDTO dto) throws Exception;

	// 게시글 작성
	public void writeReview(OtherReviewsDTO otherReviewsDTO) throws Exception;
		
}
