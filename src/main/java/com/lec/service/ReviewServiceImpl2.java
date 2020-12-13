package com.lec.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.lec.dao.ReviewDAO;
import com.lec.dao.ReviewDAO2;
import com.lec.dto.ReviewDTO;
import com.lec.dto.ReviewDTO2;
import com.lec.dto.SearchCriteria;



@Service
public class ReviewServiceImpl2 implements ReviewService2 {

	@Inject
	private ReviewDAO2 dao;



	// 게시물 목록 조회
	@Override
	public List<ReviewDTO2> list(SearchCriteria scri) throws Exception {

		return dao.list(scri);
	}
	
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}



}















