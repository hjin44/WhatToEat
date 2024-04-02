package com.dj.wte.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dj.wte.customer.service.QnAServiceImpl;
import com.dj.wte.customer.vo.AssignVo;
import com.dj.wte.manager.service.AnswerServiceImpl;
import com.dj.wte.manager.service.ManagerServiceImpl;
import com.dj.wte.manager.vo.AnswerVo;
import com.dj.wte.manager.vo.ManagerVo;

@Controller
@RequestMapping("/manager/*")
public class AnswerController {
	
	@Autowired
	private AnswerServiceImpl answerService;
	
	@Autowired
	private QnAServiceImpl qnAService;
	
	@Autowired
	private ManagerServiceImpl managerService;

	@RequestMapping("QandA_page.do")
	public String managerQandAPage(Model model, ManagerVo vo, HttpSession session) {
		ManagerVo sessionManager = (ManagerVo)session.getAttribute("sessionManager");
		
		if(sessionManager != null) {

			int manager_no = sessionManager.getManager_no();
			
			ArrayList<HashMap<String, Object>> askList = answerService.getAskList(manager_no);
			
			ArrayList<HashMap<String, Object>> completeList = answerService.getCompleteList(manager_no);
			
			ArrayList<HashMap<String, Object>> managerList = answerService.getAllManager();
			
			model.addAttribute("askList", askList);
			model.addAttribute("completeList", completeList);
			model.addAttribute("managerList", managerList);
			//System.out.println("askList : " + askList);
			//System.out.println("model : " + model);
			
			
			return "/manager/QandA_page";
		}else {
			return "/manager/manager_login_page";
		}
	}
	
	@RequestMapping("answer_page.do")
	public String answerPage(Model model, int ask_no) {
		
		HashMap<String, Object> map = qnAService.getAsk(ask_no);
		
		model.addAttribute("result", map);
		
		ArrayList<HashMap<String, Object>> answerList = answerService.getAnswerList(ask_no);
		
		model.addAttribute("answerList", answerList);
		
		
		return "manager/answer_page";
	}
	
	@RequestMapping("answer_process.do")
	public String answerWriteProcess(AnswerVo param, HttpSession session, int ask_no) {
		
		answerService.writeAnswer(param, ask_no);
		

		return "redirect:./answer_page.do?ask_no=" + ask_no;
	}
	
	@RequestMapping("delete_ask_process.do")
	public String deleteAskProcess(int ask_no) {
		qnAService.deleteAsk(ask_no);
		
		return "redirect:./QandA_page.do";
	}
}
