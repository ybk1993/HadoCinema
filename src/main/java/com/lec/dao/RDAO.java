package com.lec.dao;


import com.lec.dto.ReviewDTO2;


public interface RDAO {

	// 리뷰 크롤링
	public void writeReview(ReviewDTO2 reviewDTO2) throws Exception;
		

}
