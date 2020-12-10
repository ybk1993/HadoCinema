package com.command.write;

import org.springframework.ui.Model;

import com.lec.beans.C;
import com.lec.dao.*;


public class MListCommand implements BCommand {

	@Override
	public void execute(Model model) {
		//BWriteDAO dao = new BWriteDAO();
		//List<BWriteDTO> list = dao.select();
		
		// MyBatis 사용
		MovieInfoDAO dao = C.sqlSession.getMapper(MovieInfoDAO.class);
		model.addAttribute("list", dao.select());
	}

}












