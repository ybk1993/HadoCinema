package com.lec.dao;


import com.lec.dto.CsDTO;



public interface CsDAO {

	// 게시글 작성
	public void write(CsDTO csDTO) throws Exception;
	

}
