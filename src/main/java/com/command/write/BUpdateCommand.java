package com.command.write;

import java.util.Map;

import org.springframework.ui.Model;

import com.lec.dao.*;
import com.lec.beans.C;
import com.lec.dto.*;

public class BUpdateCommand implements BCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		BWriteDTO dto = (BWriteDTO)map.get("dto");
		
		//BWriteDAO dao = new BWriteDAO();
		//int cnt = dao.update(dto);
		
		FaqDAO dao = C.sqlSession.getMapper(FaqDAO.class);
		//model.addAttribute("result", dao.update(dto));
		model.addAttribute("result", dao.update(dto.getUid(), dto));
	}

}















