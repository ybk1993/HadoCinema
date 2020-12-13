package com.lec.service;


import java.util.List;


import com.lec.dto.ReviewDTO;
import com.lec.dto.ReviewDTO2;
import com.lec.dto.SearchCriteria;



public interface ReviewService2 {



	// 게시물 목록 조회
	public List<ReviewDTO2> list(SearchCriteria scri) throws Exception;
	
	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	

}
