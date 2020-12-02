package com.lec.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/main")
	public String main() {
		return "admin/main/dashboard";
	}

	@RequestMapping("/base")
	public String base() {
		return "admin/admin_base";
	}
	
	
	@RequestMapping("/charts")
	public String charts() {
		return "admin/main/charts";
	}
	@RequestMapping("/tables")
	public String tables() {
		return "admin/main/tables";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "admin/main/login";
	}
	@RequestMapping("/register")
	public String register() {
		return "admin/main/register";
	}
	@RequestMapping("/forgotpw")
	public String forgotpw() {
		return "admin/main/forgotpw";
	}
	
	
	
	
	@RequestMapping("/err401")
	public String err401() {
		return "admin/error/err401";
	}
	@RequestMapping("/err404")
	public String err404() {
		return "admin/error/err404";
	}
	@RequestMapping("/err500")
	public String err500() {
		return "admin/error/err500";
	}
	
	
}
