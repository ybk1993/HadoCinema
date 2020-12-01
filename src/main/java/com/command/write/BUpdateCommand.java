package com.command.write;

import java.util.Map;

import org.springframework.ui.Model;

import com.lec.beans.BWriteDTO;
import com.lec.beans.IWriteDAO;

import common.C;

public class BUpdateCommand implements BCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		BWriteDTO dto = (BWriteDTO)map.get("dto");
		
		//BWriteDAO dao = new BWriteDAO();
		//int cnt = dao.update(dto);
		
		IWriteDAO dao = C.sqlSession.getMapper(IWriteDAO.class);
		model.addAttribute("result", dao.update(dto));
	}

}















