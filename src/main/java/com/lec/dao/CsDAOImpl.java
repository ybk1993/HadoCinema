package com.lec.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lec.dto.CsDTO;



@Repository
public class CsDAOImpl implements CsDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(CsDTO csDTO) throws Exception {
		sqlSession.insert("csMapper.insert", csDTO);
		
	}

	


	
}




















