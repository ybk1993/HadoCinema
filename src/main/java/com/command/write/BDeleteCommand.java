package com.command.write;

import java.util.Map;

import org.springframework.ui.Model;

import com.lec.beans.C;
import com.lec.dao.*;



public class BDeleteCommand implements BCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int faq_uid = (Integer)map.get("uid");
		//BWriteDAO dao = new BWriteDAO();
		//int cnt = dao.deleteByUid(uid);
		
		FaqDAO dao = C.sqlSession.getMapper(FaqDAO.class);
		model.addAttribute("result", dao.deleteByUid(faq_uid));
		
		//model.addAttribute("result", new BWriteDAO().deleteByUid((Integer)(model.asMap().get("uid"))));
	}

}
















