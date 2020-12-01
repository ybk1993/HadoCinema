package com.command.write;

import org.springframework.ui.Model;

import com.lec.beans.BWriteDTO;
import com.lec.beans.IWriteDAO;

import common.C;

public class BWriteCommand implements BCommand {

	// 커맨드 객체(request parameter들)를 "dto" 라는 이름으로 Model 에 담아 호출됨
	@Override
	public void execute(Model model) {
		// Model 안에 담긴 값(attribute) 꺼내기
		BWriteDTO dto = (BWriteDTO)model.getAttribute("dto");
		//BWriteDAO dao = new BWriteDAO();
		//int result = dao.insert(dto);
		
		// MyBatis 사용
		IWriteDAO dao = C.sqlSession.getMapper(IWriteDAO.class);
		//model.addAttribute("result", dao.insert(dto));			
		
		model.addAttribute("result", 
				dao.insert(dto.getSubject(), dto.getContent(), dto.getName()));
	} // end execute()
} // end Command
















