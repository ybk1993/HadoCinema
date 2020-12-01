package com.command.write;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.lec.beans.BWriteDTO;
import com.lec.beans.IWriteDAO;

import common.C;

public class BViewCommand implements BCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int uid = (Integer)map.get("uid");
		
//		BWriteDAO dao = new BWriteDAO();
//		List<BWriteDTO> list = dao.readByUid(uid);
		
		IWriteDAO dao = C.sqlSession.getMapper(IWriteDAO.class);
		dao.incViewCnt(uid);  // 조회수 증가
		
		List<BWriteDTO> list = dao.selectByUid(uid);
		
		model.addAttribute("list", list);
	}

}














