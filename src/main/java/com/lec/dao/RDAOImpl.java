package com.lec.dao;


import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.lec.dto.ReviewDTO2;

@Repository
public class RDAOImpl implements RDAO {

	@Inject
	private SqlSession sqlSession;
	

	// 리뷰 크롤링
	@Override
	public void writeReview(ReviewDTO2 reviewDTO2) throws Exception {
		sqlSession.insert("review2Mapper.insertC", reviewDTO2);
		
	}



	
}




















