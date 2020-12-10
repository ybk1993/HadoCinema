package com.command.write;

import java.util.Map;

import org.springframework.ui.Model;

import com.lec.beans.C;
import com.lec.dao.*;


public class BSelectCommand implements BCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int uid = (Integer)map.get("uid");

		//BWriteDAO dao = new BWriteDAO();
		//List<BWriteDTO> list = dao.selectByUid(uid);
		
		FaqDAO dao = C.sqlSession.getMapper(FaqDAO.class);
		model.addAttribute("list", dao.selectByUid(uid));
	}

}















