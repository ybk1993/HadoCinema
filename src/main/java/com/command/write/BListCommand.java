package com.command.write;

import org.springframework.ui.Model;
import com.lec.beans.C;
import com.lec.dao.*;


public class BListCommand implements BCommand {

	@Override
	public void execute(Model model) {
		//BWriteDAO dao = new BWriteDAO();
		//List<BWriteDTO> list = dao.select();
		
		// MyBatis 사용
		FaqDAO dao = C.sqlSession.getMapper(FaqDAO.class);
		model.addAttribute("list", dao.select());
	}

}