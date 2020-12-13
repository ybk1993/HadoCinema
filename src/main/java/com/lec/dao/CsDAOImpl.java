package com.lec.dao;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lec.dto.Criteria;
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
	// 게시글 답변 [ 작성자 ]
	@Override
	public void answer(CsDTO csDTO) throws Exception {
		sqlSession.update("csMapper.update", csDTO);
//insert("csMapper.insert", csDTO);	
	}

	// 게시물 목록 조회
	@Override
	public List<CsDTO> list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("csMapper.listPage", cri);
	}
	
	// 게시물 총 갯수
	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("csMapper.listCount");
	}
	
	// 게시물 조회
	@Override
	public CsDTO read(int cs_uid) throws Exception {	
		return sqlSession.selectOne("csMapper.read", cs_uid);
	}

	
}




















