package com.lec.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;


import org.springframework.stereotype.Repository;

import com.lec.dao.memberDAO;
import com.lec.dto.memberDTO;

@Repository
public class memberServiceImpl implements memberService{

	@Inject
	private memberDAO dao;
	
	
//	//중복체크
	@Override
	public boolean getMemUserid(String userid) {
		
//		System.out.println("아이디는 " + userid);
		String getId = dao.getMemUserid(userid);
		
		if(!getId.equals("") && getId != null) {
			return true;
			
		}
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
//		System.out.println("service 접근성공!");
		
		return dao.register(dto);
	}
	
	//로그인
	@Override
	public memberDTO login(memberDTO dto){
		System.out.println("service -> dao 요청");
		return dao.login(dto);
	}
	
	//회원정보수정
	@Override
	public void updateMemInfo(memberDTO dto){
		
	}
//	
//	//회원정보
//	@Override
//	public List<memberDTO> getMemInfo(memberDTO dto){
//		
//		return dao.getMemInfo(dto);
//	}
//	
//	//아이디찾기
//	@Override
//	public String findMemUserid(memberDTO dto){
//		
//		return dao.findMemUserid(dto);
//	}
//	
//	//비밀번호찾기
//	@Override
//	public String findMemUserpw(memberDTO dto){
//		
//		return dao.findMemUserpw(dto);
//	}
//		
//	//메일 중복 체크
//	@Override
//	public String chkMemEmail(String email){
//		
//		return dao.chkMemEmail(email);
//	}
//	

//	
//	//탈퇴하기
//	@Override
//	public void withdrawMem(memberDTO dto){
//		
//	}
//	
//	//포인트 조회
//	@Override
//	public void getMemPoint(memberDTO dto){
//		
//	}
//	
//	//예매내역 조회
//	@Override
//	public void getMembooking(memberDTO dto){
//		
//	}
//	
	
}
