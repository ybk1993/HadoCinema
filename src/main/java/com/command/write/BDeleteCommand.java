package com.command.write;

import java.util.Map;

import org.springframework.ui.Model;

import com.lec.beans.IWriteDAO;

import common.C;

public class BDeleteCommand implements BCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int uid = (Integer)map.get("uid");
		//BWriteDAO dao = new BWriteDAO();
		//int cnt = dao.deleteByUid(uid);
		
		IWriteDAO dao = C.sqlSession.getMapper(IWriteDAO.class);
		model.addAttribute("result", dao.deleteByUid(uid));
		
		//model.addAttribute("result", new BWriteDAO().deleteByUid((Integer)(model.asMap().get("uid"))));
	}

}
















