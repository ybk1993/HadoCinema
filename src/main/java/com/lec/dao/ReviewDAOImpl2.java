package com.lec.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lec.dto.ReviewDTO2;
import com.lec.dto.SearchCriteria;



@Repository
public class ReviewDAOImpl2 implements ReviewDAO2 {

	@Inject
	private SqlSession sqlSession;
	


	// 게시물 목록 조회
	@Override
	public List<ReviewDTO2> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("review2Mapper.listPageC", scri);
	}
	
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("review2Mapper.listCountC", scri);
	}

	
	


}






