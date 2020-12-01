package com.lec.beans;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.command.write.BCommand;

import common.C;

@Controller
@RequestMapping("/ticket")
public class TicketController {
	
	private BCommand command;
	
	// MyBatis
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}
	
	@RequestMapping("/ticketing")
	public void ticketing() {
		
		
	}
	
	@RequestMapping("/choiceSeat")
	public void choiceSeat() {
		
		
	}
	
	@RequestMapping("/payment")
	public void pay() {
		
		
	}
	
	@RequestMapping("/payOk")
	public void payOk() {
		
		
	}
	
}
