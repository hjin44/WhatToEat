package com.dj.wte.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dj.wte.manager.service.AnswerServiceImpl;
import com.dj.wte.manager.vo.AnswerVo;
import com.dj.wte.manager.vo.ManagerVo;

@Controller
@RequestMapping("/manager/*")
@ResponseBody
public class RESTfulQnAController {
	
	@Autowired
	private AnswerServiceImpl answerService;
	
	@RequestMapping("get_answer_list.do")
	public ArrayList<HashMap<String, Object>> getAnswerList(int ask_no){
		
		ArrayList<HashMap<String, Object>> result = answerService.getAnswerList(ask_no);
		
		return result;
	}
	
	@RequestMapping("write_answer_process.do")
	public void writeAnswerProcess(AnswerVo param, int ask_no) {
		
		answerService.writeAnswer(param, ask_no);
	}
	
	@RequestMapping("delete_answer_process.do")
	public void deleteAnswerProcess(int ask_no) {
		answerService.deleteAnswer(ask_no);
	}
	
	@RequestMapping("update_answer_process.do")
	public void updateAnswerProcess(AnswerVo param, int ask_no) {
		answerService.updateAnswer(param, ask_no);
		
	}

	@RequestMapping("transfer_answer_process.do")
	public void transferAnswerProcess(int ask_no, int select_manager) {
		answerService.transferAnswer(ask_no, select_manager);
	}
}
