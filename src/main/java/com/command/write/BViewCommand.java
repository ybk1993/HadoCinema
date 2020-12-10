package com.command.write;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.lec.beans.C;
import com.lec.dao.*;
import com.lec.dto.*;


public class BViewCommand implements BCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int uid = (Integer)map.get("uid");
		
//		BWriteDAO dao = new BWriteDAO();
//		List<BWriteDTO> list = dao.readByUid(uid);
		
		FaqDAO dao = C.sqlSession.getMapper(FaqDAO.class);
		
		
		List<BWriteDTO> list = dao.selectByUid(uid);
		
		model.addAttribute("list", list);
	}

}














