package com.command.write;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.lec.beans.C;
import com.lec.dao.*;
import com.lec.dto.*;

public class MViewCommand implements BCommand {
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int uid = (Integer)map.get("uid");
		
		// MyBatis 사용
		MovieInfoDAO dao = C.sqlSession.getMapper(MovieInfoDAO.class);
		List<MWriteDTO> list = dao.selectByUid(uid);
		
		model.addAttribute("list", list);
	
	}

}
