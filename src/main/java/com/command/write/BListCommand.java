package com.command.write;

import org.springframework.ui.Model;

import com.lec.beans.IWriteDAO;

import common.C;

public class BListCommand implements BCommand {

	@Override
	public void execute(Model model) {
		//BWriteDAO dao = new BWriteDAO();
		//List<BWriteDTO> list = dao.select();
		
		// MyBatis 사용
		IWriteDAO dao = C.sqlSession.getMapper(IWriteDAO.class);
		model.addAttribute("list", dao.select());
	}

}












