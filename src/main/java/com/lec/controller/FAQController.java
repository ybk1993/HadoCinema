package com.lec.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.command.write.BCommand;
import com.command.write.BDeleteCommand;
import com.command.write.BListCommand;
import com.command.write.BSelectCommand;
import com.command.write.BUpdateCommand;
import com.command.write.BViewCommand;
import com.command.write.BWriteCommand;
import com.lec.beans.C;
import com.lec.dto.BWriteDTO;

@Controller
@RequestMapping("/faq")
public class FAQController {

	
		
		private BCommand command;
		
		// MyBatis
		private SqlSession sqlSession;
		
		@Autowired
		public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
			C.sqlSession = sqlSession;
		}
		
		@RequestMapping("/faq")
		public String faq(Model model) {
			command = new BListCommand();
			command.execute(model);		
//			return "faq/faq";
			return "faq/faq";
		}

		@RequestMapping("/list")
		public String list(Model model) {
			command = new BListCommand();
			command.execute(model);		
			return "admin/list";
		}
		
		@RequestMapping("/write.do")
		public String write(Model model){
			return "faq/write";
		}
		
		@RequestMapping(value="/writeOk.do", method = RequestMethod.POST)
		public String writeOk(BWriteDTO dto, Model model) {
			model.addAttribute("dto", dto);
			new BWriteCommand().execute(model);
			return "faq/writeOk";
		}
		
		@RequestMapping("/view.do")
		public String view(int uid, Model model) {
			model.addAttribute("uid", uid);
			new BViewCommand().execute(model);
			return "faq/view";
		}
		
		@RequestMapping("/update.do")
		public String update(int uid, Model model) {
			model.addAttribute("uid", uid);
			new BSelectCommand().execute(model);		
			return "faq/update";
		}
		
		@RequestMapping(value="/updateOk.do", method= RequestMethod.POST)
		public String updateOk(BWriteDTO dto, Model model) {
			model.addAttribute("dto", dto);
			
			new BUpdateCommand().execute(model);
			
			return "faq/updateOk";
		}
		
		@RequestMapping(value="/deleteOk.do")
		public String deleteOk(int uid, Model model) {
			model.addAttribute("uid", uid);
			new BDeleteCommand().execute(model);
			return "faq/deleteOk";
		}
}
