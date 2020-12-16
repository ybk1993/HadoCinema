package com.lec.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.lec.controller.MemRestController;
import com.lec.dao.memberDAO;
import com.lec.dto.memberDTO;

@Repository
public class memberServiceImpl implements memberService{

	@Inject
	private memberDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(MemRestController.class);
//	//중복체크
	@Override
	public boolean getMemUserid(String userid) {
		logger.debug("아이디 중복체크 :: service -> dao 요청");
		String getId = dao.getMemUserid(userid);
		if(!getId.equals("") && getId != null) return true;
		
		return false;
	}
	
	//메일 중복 체크
	@Override
	public boolean chkMemEmail(String email){
		logger.debug("chkMemEmail :: service -> dao 요청 ["+email+"]");
		String getMail = dao.chkMemEmail(email);
		if(!getMail.equals("") && getMail != null) return true;
		
		return false;
	}
	
	@Override
	public List<memberDTO> allMember(memberDTO dto){
		List<memberDTO> list = new ArrayList<memberDTO>();
		list = dao.allMember(dto);
		return list;
	}

	//회원가입
	@Override
	public boolean register(memberDTO dto){
		logger.debug("register :: service -> dao 요청");		
		return dao.register(dto);
	}
	
	//로그인
	@Override
	public memberDTO login(memberDTO dto){
		logger.debug("login :: service -> dao 요청");
		return dao.login(dto);
	}
	
	//회원정보수정
	@Override
	public void updateMemInfo(memberDTO dto){
		logger.debug("updateMemInfo :: service -> dao 요청");
		dao.updateMemInfo(dto);
	}
	
//	//아이디찾기
//	@Override
//	public String findMemUserid(memberDTO dto){
//		
//		return dao.findMemUserid(dto);
//	}
//	//비밀번호찾기
//	@Override
//	public String findMemUserpw(memberDTO dto){
//		
//		return dao.findMemUserpw(dto);
//	}
//	//탈퇴하기
//	@Override
//	public void withdrawMem(memberDTO dto){
//		
//	}
}
