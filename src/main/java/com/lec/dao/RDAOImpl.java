package com.lec.dao;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.lec.dto.OtherReviewsDTO;

@Repository
public class RDAOImpl implements RDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void exchange(OtherReviewsDTO dto) throws Exception {
		
		sqlSession.insert("otherReview.insert", dto);
		
	};

	// 게시글 작성
	@Override
	public void writeReview(OtherReviewsDTO otherReviewsDTO) throws Exception {
		sqlSession.insert("otherReview.insert", otherReviewsDTO);
		
	}



	
}




















