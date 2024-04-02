package com.dj.wte.manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import com.dj.wte.manager.service.ManagerServiceImpl;
import com.dj.wte.manager.vo.ManagerVo;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {
	
	@Autowired
	private ManagerServiceImpl managerService;

	@RequestMapping("manager_login_page.do")
	public String manageLoginPage() {
		return "/manager/manager_login_page";
	}
	
	@RequestMapping("manager_login_process.do")
	public String ManagerLoginProcess(ManagerVo vo, HttpSession session) {
		
		ManagerVo sessionManager = managerService.login(vo);
		
		if(sessionManager != null) {
			session.setAttribute("sessionManager", sessionManager);
			
			return "redirect:../manager/manager_main_page.do";
		}else {
			return "/manager/manager_login_fail_page";
		}	
	}
	
	@RequestMapping("manager_logout_process.do")
	public String managerLogoutProcess(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		
		String referer = request.getHeader("Referer");
		if(referer != null && !referer.equals("")) {
			return "redirect:" + referer;
		}else {
			return "redirect:/";
		}
		
	}	
	
	@RequestMapping("manager_main_page.do")
	public String managerMainPage() {
		return "/manager/manager_main_page";
	}
	
	@RequestMapping("manager_graph_page.do")
	public String managerGraphPage() {
		return "/manager/manager_graph_page";
	}

}
