package com.lec.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.lec.dto.memberDTO;



@Repository
public class memberDAOImpl implements memberDAO{

	@Autowired
	private SqlSession sqlSession;
	
//	//아이디 중복체크
	@Override
	public String getMemUserid(String userid){
		
		String getId = sqlSession.selectOne("getMemUserid", userid);
		System.out.println(getId);
		if(getId == null) {
			getId = "";
		}
			return getId;
		
	}
	
	@Override
	public List<memberDTO> allMember(memberDTO dto) {
		List<memberDTO> list = new ArrayList<memberDTO>();
		list = sqlSession.selectList("allMember", dto);
		
		return list;
	}

	//회원가입
	@Override
	public boolean register(memberDTO dto){
//		System.out.println("이곳은 DAO");
		int cnt = sqlSession.insert("register", dto);
		if(cnt > 0) System.out.println("회원가입 성공!");
		else System.out.println("가입 실패!");
		
		
		return cnt > 0 ? true : false;
	}
	
	//로그인
	@Override
	public memberDTO login(memberDTO dto){
		System.out.println("dao -> mapper 데이터 요청");
		memberDTO loginInfo = sqlSession.selectOne("login", dto);
		
		return loginInfo;
	}
	
	//회원정보 수정
	@Override
    public void updateMemInfo(memberDTO dto) {
        sqlSession.update("updateMemInfo", dto); 
    }
//	
//	//회원정보
//	@Override
//	public List<memberDTO> getMemInfo(memberDTO dto) {
//		List<memberDTO> list = new ArrayList<memberDTO>();
//		list = sqlSession.selectList("getMemInfo", dto);
//		
//		return list;
//	}
//	
//	//아이디찾기
//	@Override
//	public String findMemUserid(memberDTO dto) {
//		
//		String findMemUserid = sqlSession.selectOne("findMemUserid", dto);
//		if(findMemUserid == null) {
//			findMemUserid = "";
//		}
//		return findMemUserid;
//	}
//	
//	//비밀번호찾기
//	@Override
//	public String findMemUserpw(memberDTO dto) {
//		String findMemUserpw = sqlSession.selectOne("findMemUserpw", dto);
//		if(findMemUserpw == null) {
//			findMemUserpw = "";
//		}
//		return findMemUserpw;
//	}
//	
//	
//	//메일 중복 체크
//	@Override
//	public String chkMemEmail(String email) {
//		String chkMemEmail = sqlSession.selectOne("chkMemEmail", email);
//		if(chkMemEmail == null) {
//			chkMemEmail = "";
//		}
//		return chkMemEmail;
//	}
//	
//	
//	//탈퇴하기
//	@Override
//	public void withdrawMem(memberDTO dto) {
//		sqlSession.update("withdrawMem", dto); 
//	}
//	
//	//포인트 조회
//	@Override
//	public void getMemPoint(memberDTO dto) {
//		sqlSession.selectOne("getMemPoint", dto);
//	}
//	
//	//예매내역 조회
//	@Override
//	public void getMembooking(memberDTO dto) {
//		sqlSession.selectOne("getMembooking", dto);
//	}
	
	

	
	
	
	
}
