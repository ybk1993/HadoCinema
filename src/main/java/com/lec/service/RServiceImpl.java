package com.lec.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.lec.dao.RDAO;
import com.lec.dto.ReviewDTO2;





@Service
public class RServiceImpl implements RService {
	@Inject
	private RDAO dao;
	

	// 게시글 작성
	@Override
	public void writeReview(ReviewDTO2 reviewDTO2) throws Exception {
		dao.writeReview(reviewDTO2);
	}



}

