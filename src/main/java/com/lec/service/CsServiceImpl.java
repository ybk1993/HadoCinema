package com.lec.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lec.dao.CsDAO;
import com.lec.dto.CsDTO;



@Service
public class CsServiceImpl implements CsService {

	@Inject
	private CsDAO dao;
	
	// 게시글 작성
	@Override
	public void write(CsDTO csDTO) throws Exception {
		dao.write(csDTO);
	}

	

}















