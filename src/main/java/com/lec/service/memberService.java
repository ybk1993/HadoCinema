package com.lec.service;

import java.util.List;

import com.lec.dto.CsDTO;
import com.lec.dto.memberDTO;

public interface memberService {

	public List<memberDTO> allMember(memberDTO dto);
	
	//중복체크
	public boolean getMemUserid(String userid);

	//회원가입
	public boolean register(memberDTO dto);
	
	//로그인
	public String login(String id);
//	
//	//회원정보
//	public List<memberDTO> getMemInfo(memberDTO dto);
//	
//	//아이디찾기
//	public String findMemUserid(memberDTO dto);
//	
//	//비밀번호찾기
//	public String findMemUserpw(memberDTO dto);
//		
//	//메일 중복 체크
//	public String chkMemEmail(String email);
//	
//	//회원정보수정
//	public void updateMemInfo(memberDTO dto);
//	
//	//탈퇴하기
//	public void withdrawMem(memberDTO dto);
//	
//	//포인트 조회
//	public void getMemPoint(memberDTO dto);
//	
//	//예매내역 조회
//	public void getMembooking(memberDTO dto);
}
