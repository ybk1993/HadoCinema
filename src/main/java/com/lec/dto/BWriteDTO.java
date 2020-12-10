package com.lec.dto;

import java.sql.Timestamp;

// DTO : Data Transfer Object

public class BWriteDTO {
	private int uid;    // faq_uid
	private String subject;  // faq_subject
	private String answer;  // faq_answer
	private Timestamp regDate;   // faq_regDate
	
	
	// 웹개발시..
	// 가능한, 다음의 3가지 이름을 일치시켜 주는게 좋습니다.
	// DB필드명 = 클래스필드명 = form 의 name 명
	
	// 기본생성자
	public BWriteDTO() {
		super();
//		System.out.println("WriteDTO() 객체 생성");
	}


	
	public BWriteDTO(int uid, String subject, String answer, Timestamp regDate) {
		super();
		this.uid = uid;
		this.subject = subject;
		this.answer = answer;
		this.regDate = regDate;
	}



	public int getUid() {
		return uid;
	}



	public void setUid(int uid) {
		this.uid = uid;
	}



	public String getSubject() {
		return subject;
	}



	public void setSubject(String subject) {
		this.subject = subject;
	}



	public String getAnswer() {
		return answer;
	}



	public void setAnswer(String answer) {
		this.answer = answer;
	}



	public Timestamp getRegDate() {
		return regDate;
	}



	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}



	// 개발할때  Class 의   toString() 오버라이딩 해주면
		// 디버깅이나 테스트 하기 좋다.

	
	
	
	

		
} // end DTO

















