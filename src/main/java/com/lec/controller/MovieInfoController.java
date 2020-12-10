package com.lec.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.command.write.BCommand;
import com.command.write.BListCommand;
import com.command.write.BViewCommand;
import com.command.write.BWriteCommand;
import com.command.write.MListCommand;
import com.command.write.MViewCommand;
import com.command.write.MWriteCommand;
import com.lec.beans.C;
import com.lec.dto.*;

@Controller
@RequestMapping("/movieInfo")
public class MovieInfoController {

	private BCommand command;
	
	// MyBatis
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}
	
	
	@RequestMapping("/info")
	public String info(int uid, Model model) {
		model.addAttribute("uid", uid);
		new MViewCommand().execute(model);
		return "movieInfo/info";
	}
	
	@RequestMapping("/movieChart")
	public String faq(Model model) {
		command = new MListCommand();
		command.execute(model);		
		return "movieInfo/movieChart";
	}
	
	@RequestMapping("/movieSave")
	public String write(Model model){
		return "movieInfo/movieSave";
	}
	
	@RequestMapping(value="/movieSaveOk", method = RequestMethod.POST)
	public String writeOk(MWriteDTO dto, Model model) {
		
		model.addAttribute("dto", dto);
		new MWriteCommand().execute(model);
		return "movieInfo/movieSaveOk";
	}
}
